# 2021-1 - Quarta Noite
Repositório da disciplina "Computação Móvel"

---

### Preparação do ambiente

A preparação do ambiente pode ser vista 100% no material AVA que foi desenvolvido por este professor e é bastante recente.
<br>
De qualquer maneira, a preparação do ambiente é bastante simples:

 1. "Instalar" o Flutter
    Acessar https://flutter.dev/docs/get-started/install
    Escolher seu Sistema Operacional
    Baixar o zip da SDK do Flutter
    Extrair em um local seguro
      Ex: Se vc. utiliza Windows, C:\sdk\flutter

2. Acertar a variáveis de ambiente no Sistema (para usuários Windows)
    Abrir as configurações do sistema (Tecla Windows + Pause Break)
    Clicar em "Variáveis de ambiente"
    Selecionar Path (do usuário ou do sistema se for instalar para todos os usuarios)
    Editar essa chave
    Acrescentar o caminho do flutter/bin (a mesma pasta onde v. extraiu o Flutter / bin)

<fechar todas as instâncias do terminal depois disso e abrir novamente>

Para usuários de MAC:
  2.1 - Ignorar o passo 2 e acertar o .bash_profile. Vide: https://flutter.dev/docs/get-started/install/macos#update-your-path
  Obs: Se você é usuário de Mac e utiliza o ZSH, atualizar o path no arquivo ".zshrc". Vide: https://superuser.com/questions/886132/where-is-the-zshrc-file-on-mac


3. Instalar o Android Studio
    Baixar de: https://developer.android.com/studio
    Instalar normalmente
    ATENÇÃO: Não podem haver espaços e/ou caracteres especiais na pasta de instalação do Android Studio!

4. Abrir o Android Studio e configurá-lor
    Clicar em "Configure" -> SDK Manager
    Clicar na aba "SDK Tools"
    Selecionar "Android-SDK Command Line Tools"
    Instlar normalmente
    Depois clicar em "Configure" --> Plugins
    Procurar por "Flutter". Instalar normalmente, Reiniciar a IDE

5. Abrir o terminal e rodar: "flutter doctor"
   Se aparecer "erro" de licenças, rodar o comando "flutter doctor --android-licenses"
   Aceitar todas as licenças com "y" e enter...
   Rodar novamente "flutter doctor" e verificar se todos os itens estão Ok.
