# Guia de Publicação no GitHub e Hospedagem Grátis 🚀

Este guia explica como subir o site da **MS Brazil Cleaning Services** para o seu GitHub e como hospedá-lo **totalmente de graça** em menos de 2 minutos usando o **GitHub Pages**!

---

## Opção 1: Upload Automático (Recomendado) ⚡

Criamos um script automatizado em PowerShell que faz todo o trabalho duro para você.

1. Abra o **PowerShell** no Windows.
2. Navegue até a pasta do projeto (ou simplesmente clique com o botão direito na pasta do projeto e escolha "Abrir no Terminal").
3. Digite o seguinte comando e pressione Enter:
   ```powershell
   .\github_deploy.ps1
   ```
4. Siga as instruções na tela! O script irá pedir a URL do seu repositório do GitHub (crie um repositório vazio no GitHub primeiro) e fará o push automaticamente.

---

## Opção 2: Upload Manual 🛠️

Se você preferir rodar os comandos do Git manualmente no terminal, siga os passos abaixo:

1. Crie um repositório vazio no seu GitHub (ex: `ms-brazil-cleaning`). Não adicione README nem .gitignore.
2. Abra o terminal na pasta do projeto e execute os seguintes comandos:

```bash
# 1. Inicializar o repositório Git local
git init

# 2. Definir o nome da branch principal como 'main'
git branch -M main

# 3. Adicionar todos os arquivos do projeto
git add .

# 4. Fazer o commit inicial
git commit -m "feat: Landing page premium com otimizacoes para Safari e modal de contato"

# 5. Conectar o repositório local ao seu GitHub (substitua com a URL do SEU repositório)
git remote add origin https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git

# 6. Enviar os arquivos para o GitHub
git push -u origin main
```

---

## Hospedar o Site de Graça com o GitHub Pages! 🌐

Uma das maiores vantagens de um site estático moderno (HTML/CSS/JS puros e ultra-otimizados) é que o GitHub hospeda de graça e com alta performance global.

Após subir o código para o seu repositório no GitHub, siga estes passos simples para colocar o site no ar:

1. No seu navegador, acesse o repositório do projeto no seu **GitHub**.
2. Clique na aba **Settings** (Configurações) no topo direito da página do repositório.
3. No menu lateral esquerdo, clique em **Pages** (dentro da seção "Code and automation").
4. Na seção **Build and deployment**:
   - Em **Source**, garanta que esteja selecionado: `Deploy from a branch`.
   - Em **Branch**, selecione `main` e a pasta `/ (root)`.
   - Clique no botão **Save** (Salvar).
5. Aguarde cerca de 1 a 2 minutos. Atualize a página.
6. Um banner verde aparecerá no topo da página de configurações do GitHub Pages dizendo:
   > **Your site is live at `https://seu-usuario.github.io/seu-repositorio/`**
7. Pronto! O site estará online, carregando instantaneamente e pronto para ser compartilhado com os clientes da MS Brazil Cleaning!

---

### Benefícios dessa estrutura de hospedagem:
- **Custo Zero:** Hospedagem 100% gratuita para sempre.
- **Performance de Elite:** Distribuído via CDN global do GitHub, carregando em milissegundos.
- **SSL Grátis:** Certificado HTTPS ativo automaticamente para total segurança dos usuários.
