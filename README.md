# Ringue KOF 87 🥊🕹️

https://github.com/PublioSantos/ringue-kof-87

Homenagem em **Kof** ao jogo de luta mais complexo do Atari 2600:
**RealSports Boxing** (Atari Corp., 1987, programado por Alex DeMeo).

Todo o jogo é Kof: lógica, IA, física do ringue, placar e até a fonte
em pixels (3x5), desenhada pelo próprio programa num `Canvas` do `kof.ui`.
Sprites, nomes e arte são originais, inspirados no espírito do cartucho.

## Como rodar

O jeito mais simples: baixe **`ringue-kof-87.html`** e abra no navegador.
É o jogo inteiro num arquivo só, funciona offline.

Com o Kof instalado:

```bash
kof run ringue.kf --target js      # abre no webview do Kof
./empacotar.sh                     # gera web/ e ringue-kof-87.html
cd web && python3 -m http.server   # versão web em http://localhost:8000
```

Compilado com o Kof4j `main` (commit `317d9f6`).

## Como jogar

Clique em **LUTAR!** (ou em qualquer botão): isso ativa o teclado.

| | P1 | P2 (modo 2 jogadores) |
|---|---|---|
| Mover (esq/dir e profundidade) | W A S D (1P: também setas) | Setas |
| Jab | F (1P: também J) | 1 ou , |
| Soco no corpo | G (1P: também K) | 2 ou . |
| Gancho | H (1P: também L) | 3 ou / |
| Guarda (segurar) | R (1P: também I) | 0 ou M |

Enter = lutar / nova luta · P = pausa · N = som · botões na tela para mouse/touch.

## O que vem do RealSports Boxing

- **4 lutadores** com fichas diferentes (força, velocidade, queixo e ponto fraco na cabeça ou no corpo).
- **Energia e fôlego separados**: golpes gastam fôlego; cansado, você bate fraco, anda devagar e demora a se recuperar.
- **Ringue com profundidade**: você anda para frente e para trás, e o golpe só acerta quem está alinhado.
- **Barra de payoff**: acerte golpes para enchê-la; cheia, o gancho vira o **PAYOFF**, um soco devastador.
- **Quedas e contagem do juiz**: quem cai aperta os socos para levantar; 3 quedas = nocaute técnico.
- **Guarda, contra-golpe** (acertar quem está armando) e golpe no **ponto fraco**.
- **Rounds de 1 minuto** (3 ou 7), intervalo no corner e decisão por pontos.
- **CPU em 3 níveis** (fácil, normal, campeão) e modo **2 jogadores** no mesmo teclado.

## Som

Os 13 efeitos são sintetizados pelo próprio programa, em Kof, na abertura do
jogo: onda quadrada + ruído (LFSR) em 8 bits, como o chip TIA do 2600. Cada um
vira um WAV codificado em base64 pelo Kof e toca em 3 canais em rodízio.
Jab, corpo, gancho, payoff, bloqueio, soco no vento, gongo, contagem do juiz,
queda, torcida, levantada, sem fôlego e o blip do menu.
Liga/desliga: botão **Som** ou tecla **N**.

## Bugs do compilador encontrados (KofJS)

Durante o desenvolvimento apareceram dois bugs no backend JS; os repros estão em `bugs-kofjs/`:

1. **`bug-setstyle.kf`**: `widget.setStyle(Style("..."))` é descartado no JS gerado
   (vira a expressão morta `(b, ...)`), e uma declaração seguinte é reordenada
   para depois do uso: a página quebra com `ReferenceError: Cannot access 'l'
   before initialization`. O `kof check` passa sem erros.
2. **`bug-canvas-on.kf`**: `canvas.on("pointerdown", ...)` é descartado sem
   aviso (em `Button` o mesmo `.on` funciona).

O jogo contorna os dois (não usa `setStyle` nem eventos no canvas).

## Créditos

Criado por Públio Santos, com IA, como homenagem. RealSports Boxing é um jogo
da Atari Corp. (1987); este projeto não tem vínculo com a Atari e não usa
nenhum código, gráfico ou som do cartucho original.

Licença: MIT (uso livre), veja `LICENSE`.

---

Powered by Kof: https://github.com/KofLang
