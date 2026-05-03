<div align="center">

<img src="https://www.cobblemonbrasil.org/img/favicon.png" alt="CobblemonBrasil" width="100"/>

```
 ██████╗ ██████╗ ██████╗ ██████╗ ██╗     ███████╗███╗   ███╗ ██████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝████╗ ████║██╔═══██╗████╗  ██║
██║     ██║   ██║██████╔╝██████╔╝██║     █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
██║     ██║   ██║██╔══██╗██╔══██╗██║     ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝██████╔╝███████╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                   🇧🇷  B R A S I L
```

**Launcher Linux customizado para o servidor CobblemonBrasil**  
*Instalação automática de mods, configurações e atualizações — sem complicação.*

---

[![Linux](https://img.shields.io/badge/Plataforma-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://github.com)
[![Electron](https://img.shields.io/badge/Built%20with-Electron-47848F?style=for-the-badge&logo=electron&logoColor=white)](https://www.electronjs.org/)
[![Licença](https://img.shields.io/badge/Licença-Privada-FF4444?style=for-the-badge)](#-licença)
[![Suporte](https://img.shields.io/badge/Suporte-Issues-00CC66?style=for-the-badge&logo=github)](https://github.com/Somma11/CobblemonBrasil-linux/issues)

</div>

---

## 🗂️ Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Instalação Rápida](#-instalação-método-recomendado)
- [O que o Instalador Faz](#-o-que-o-instalador-faz-automaticamente)
- [Execução Manual](#-execução-manual)
- [Desinstalação](#-desinstalação)
- [Estrutura de Arquivos](#-estrutura-de-instalação)
- [Requisitos](#-requisitos)
- [Distros Suportadas](#-distros-suportadas)
- [Segurança](#-segurança)
- [Observações Técnicas](#-observações-técnicas)
- [Licença e Aviso](#-licença)

---

## 🧩 Sobre o Projeto

O servidor CobblemonBrasil já possui um launcher oficial — mas ele não tinha suporte para Linux. A **comunidade do pinguim** ficou de fora.

O **CobblemonBrasil Launcher** nasceu disso: **somma11**, um player do próprio servidor, resolveu o problema com as próprias mãos e criou um launcher feito especificamente para quem joga no Linux. Sem precisar configurar mods na mão, sem dor de cabeça com atualizações, sem enrolação.

> 💡 **O servidor tem o dele. Agora o Linux tem o nosso.** Se você sabe abrir um terminal, já sabe usar o launcher.

---

## 🚀 Instalação (Método Recomendado)

### Passo 1 — Baixe e execute o instalador

```bash
curl -LO https://raw.githubusercontent.com/Somma11/CobblemonBrasil-linux/refs/heads/main/install.sh
chmod +x install.sh
./install.sh
```

> ⚠️ **Dica de segurança:** Sempre verifique scripts antes de executá-los. Você pode inspecionar o conteúdo com `cat install.sh` antes de rodar.

---

## ⚙️ O que o Instalador Faz Automaticamente

O instalador é inteligente e cuida de tudo por você:

| Etapa | Descrição |
|-------|-----------|
| 🔍 **Detecção de distro** | Identifica se você usa Arch, Debian, Fedora ou derivados |
| 📦 **Dependências** | Instala automaticamente tudo que o launcher precisa |
| ⬇️ **Download** | Baixa a versão mais recente diretamente das releases |
| 📂 **Instalação** | Instala em `~/.local/share/CobblemonBrasil` |
| 🖥️ **Atalho** | Cria entrada no menu de aplicativos do seu sistema |

---

## 🖥️ Execução Manual

Caso prefira iniciar o launcher diretamente pelo terminal:

```bash
~/.local/share/CobblemonBrasil/cobblemonbrasil
```

Ou, se você já tem o atalho no menu, basta procurar por **"CobblemonBrasil"** no launcher do seu sistema (Rofi, GNOME Activities, KDE Application Launcher, etc.).

---

## 🗑️ Desinstalação

Para remover completamente o launcher e todos os seus arquivos:

```bash
curl -LO https://github.com/Somma11/CobblemonBrasil-linux/releases/latest/download/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
```

O desinstalador remove o binário, o atalho do menu e os arquivos de configuração instalados automaticamente.

---

## 📁 Estrutura de Instalação

Após a instalação, os arquivos ficam organizados da seguinte forma:

```
~/.local/share/
├── CobblemonBrasil/          # Diretório principal do launcher
│   ├── cobblemonbrasil       # Binário executável
│   ├── resources/            # Assets e recursos do Electron
│   └── ...
└── applications/
    └── cobblemonbrasil.desktop   # Atalho no menu do sistema
```

---

## 📋 Requisitos

O instalador resolve as dependências automaticamente, mas caso você queira saber o que está sendo instalado:

| Dependência | Necessidade |
|-------------|-------------|
| `curl` | Download de arquivos |
| `tar` | Extração do pacote |
| `zenity` | Interface gráfica de progresso *(opcional)* |
| `nss`, `gtk3`, `libdrm` | Bibliotecas do Electron |
| `libgbm`, `libasound2` | Suporte a áudio e renderização |

> **Nota:** Todas as bibliotecas do Electron são instaladas automaticamente. Você não precisa se preocupar com isso.

---

## 🐧 Distros Suportadas

| Distro | Status | Notas |
|--------|--------|-------|
| **Arch Linux** | ✅ Suportada | Inclui Garuda, Manjaro, EndeavourOS |
| **Debian / Ubuntu** | ✅ Suportada | Inclui Pop!_OS, Mint, elementaryOS |
| **Fedora** | ✅ Suportada | Inclui versões recentes com DNF |
| Outras distros | ⚠️ Não garantida | Pode funcionar, mas sem suporte oficial |

> Se você usa uma distro não listada e conseguiu instalar, abra uma issue para adicionarmos ao suporte oficial! 🙌

---

## 🔐 Segurança

Após baixar qualquer arquivo de release, é altamente recomendado verificar a integridade do pacote com SHA256:

```bash
# Verificar integridade do pacote
sha256sum CobblemonBrasil-x.x.x.tar.gz

# Compare com o hash publicado na página de releases do repositório
```

Os hashes oficiais estão sempre disponíveis na [página de releases](https://github.com/Somma11/CobblemonBrasil-linux/releases).

---

## 🧠 Observações Técnicas

- **Electron:** O launcher utiliza Electron como base, portanto depende de bibliotecas do sistema (`nss`, `gtk`, `libdrm`, etc.). Isso é normal e o instalador cuida de tudo.
- **AppImage descartado:** Após testes, o AppImage apresentou problemas consistentes em distros *rolling release*. O `.tar.gz` + script de instalação mostrou ser mais confiável.
- **Atualizações:** O launcher verifica atualizações automaticamente ao iniciar. Não é necessário reinstalar manualmente a cada nova versão.
- **Dados do usuário:** Configurações e dados do jogo ficam armazenados separadamente em `~/.config/CobblemonBrasil/`, fora do diretório de instalação.

---

## 📄 Licença

Este projeto é de **distribuição privada** e uso restrito conforme definido pelo projeto CobblemonBrasil.  
Redistribuição ou modificação não autorizadas são proibidas.

---

## ⚠️ Aviso Legal

> Este launcher é um projeto **não oficial** e não possui qualquer afiliação com a Mojang, Microsoft ou com os desenvolvedores do mod Cobblemon.  
> **Use por sua conta e risco.** O mantenedor não se responsabiliza por problemas decorrentes do uso do launcher.

---

## 💬 Suporte

Encontrou um bug? Tem uma sugestão? Quer pedir suporte para sua distro?

- 🐛 **Bugs e problemas:** [Abra uma issue](https://github.com/Somma11/CobblemonBrasil-linux/issues)
- 💡 **Sugestões:** [Discussions do repositório](https://github.com/Somma11/CobblemonBrasil-linux/discussions)
- 📣 **Comunidade:** Entre em contato com o mantenedor diretamente

---

<div align="center">

---

*O servidor tem o launcher dele. Agora a comunidade Linux tem o seu.* 🐧🩵

---

*Feito com muita 🍕 por **somma11***

</div>
