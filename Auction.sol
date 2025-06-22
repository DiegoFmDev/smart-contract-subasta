// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Subasta Simple
/// @author Diego F. Mamani

contract Subasta {
    address public propietario;
    uint public finSubasta;
    uint public comision = 2; // 2%
    uint constant extension = 10 minutes;

    struct Oferta {
        address ofertante;
        uint monto;
    }

    Oferta[] public ofertas;
    mapping(address => uint) public depositos;

    address public ganador;
    uint public mejorOferta;
    bool public finalizada;

    event NuevaOferta(address ofertante, uint monto);
    event SubastaFinalizada(address ganador, uint montoGanador);

    constructor(uint _duracionMinutos) {
        propietario = msg.sender;
        finSubasta = block.timestamp + (_duracionMinutos * 1 minutes);
    }

    modifier subastaActiva() {
        require(block.timestamp < finSubasta, "La subasta ya termino");
        require(!finalizada, "La subasta esta finalizada");
        _;
    }

    function ofertar() external payable subastaActiva {
        uint minimo = mejorOferta == 0 ? 0 : mejorOferta + (mejorOferta * 5 / 100);
        require(msg.value >= minimo, "Oferta debe ser al menos 5% mayor a la mejor actual");

        if (mejorOferta > 0) {
            depositos[ganador] += mejorOferta;
        }

        ofertas.push(Oferta(msg.sender, msg.value));
        mejorOferta = msg.value;
        ganador = msg.sender;

        if (finSubasta - block.timestamp <= extension) {
            finSubasta += extension;
        }

        emit NuevaOferta(msg.sender, msg.value);
    }

    function tiempoRestante() public view returns (uint) {
        if (block.timestamp >= finSubasta) {
            return 0;
        } else {
            return finSubasta - block.timestamp;
        }
    }

    function finalizarSubasta() external {
        require(block.timestamp >= finSubasta, "La subasta sigue activa");
        require(!finalizada, "La subasta ya fue finalizada");

        finalizada = true;

        uint montoComision = (mejorOferta * comision) / 100;
        uint montoParaPropietario = mejorOferta - montoComision;

        payable(propietario).transfer(montoComision);
        payable(propietario).transfer(montoParaPropietario);

        emit SubastaFinalizada(ganador, mejorOferta);
    }

    function retirarFondos() external {
        require(finalizada, "Debe finalizar la subasta primero");
        require(msg.sender != ganador, "El ganador no puede retirar fondos");

        uint monto = depositos[msg.sender];
        require(monto > 0, "No tienes fondos para retirar");

        depositos[msg.sender] = 0;
        payable(msg.sender).transfer(monto);
    }

    function mostrarGanador() external view returns (address, uint) {
        return (ganador, mejorOferta);
    }

    function mostrarOfertas() external view returns (Oferta[] memory) {
        return ofertas;
    }
}
