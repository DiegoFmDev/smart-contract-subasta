# 🧾 Smart Contract - Subasta (Trabajo Final Módulo 2)

Este contrato inteligente implementa una subasta simple con las funcionalidades requeridas por el módulo 2 del curso. Está desplegado en la red **Sepolia** y permite a múltiples usuarios ofertar por un artículo, con gestión de depósitos, reembolsos, y eventos.

---

## ⚙️ Funcionalidades

- **Constructor**: Inicializa la subasta con una duración de minutos (5min para los testeos rápidos).
- **ofertar()**: Permite hacer una oferta que debe superar en al menos 5% la oferta actual.
- **mostrarGanador()**: Muestra el ganador y su oferta.
- **mostrarOfertas()**: Muestra en una lista todas las ofertas hechas (para ver bien, expandir en Remiz
- **finalizarSubasta()**: Finaliza la subasta, cobra 2% de comisión, y transfiere el resto.
- **retirarFondos()**: Permite a los perdedores retirar su dinero.
- ⏳ Si alguien oferta en los últimos 10 minutos, el tiempo de subasta se extiende 10 minutos.

---

## 🧪 Usar el contrato en Remix

1. Abrir [Remix IDE](https://remix.ethereum.org/).
2. Crear un nuevo archivo `Subasta.sol` y pegar el código.
3. Ir a **Solidity Compiler** y compilar con versión `0.8.20`.
4. Ir a **Deploy & Run Transactions**.
5. Cambiar ambiente a **Injected Provider - MetaMask (Sepolia)**.
6. Poner duración (ej: `20`) y desplegar.
7. Usar las funciones para:
   - Hacer ofertas (`ofertar()`).
   - Ver ganador (`mostrarGanador()`).
   - Ver ofertas (`mostrarOfertas()`).
   - Finalizar la subasta (`finalizarSubasta()`).
   - Retirar fondos (`retirarFondos()`).

---

## 🛠️ Requisitos cumplidos

✅ Constructor  
✅ Función para ofertar (5% extra, mientras esté activa)  
✅ Mostrar ganador  
✅ Mostrar ofertas  
✅ Devolver depósitos  
✅ Comisión del 2%  
✅ Eventos: NuevaOferta, SubastaTerminada  
✅ Extensión de 10 minutos si hay oferta al final  
✅ Reembolso automático a perdedores  
✅ Código limpio, claro, y documentado

---

## 🔗 Contrato desplegado

- [🔎 Ver en Etherscan Sepolia](https://sepolia.etherscan.io/address/0xc7a7c6994cc64818c31e0060ef58f35539b23b34)
- [📄 Verificación del código](https://sepolia.etherscan.io/address/0xc7a7c6994cc64818c31e0060ef58f35539b23b34#code)

---

## 👨‍💻 Autor

- Diego F. Mamani Q.
