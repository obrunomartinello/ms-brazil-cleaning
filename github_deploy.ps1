# =========================================================================
# MS Brazil Cleaning – Script de Publicação Automática no GitHub 🚀
# =========================================================================

Clear-Host
Write-Host "==========================================================" -ForegroundColor Magenta
Write-Host "     MS BRAZIL CLEANING - PUBLICAR NO GITHUB 🚀" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Magenta
Write-Host ""

# 1. Verificar se o Git está instalado
try {
    $gitVersion = git --version 2>$null
    if ($null -eq $gitVersion) {
        throw "Git não encontrado"
    }
    Write-Host "✓ Git detectado: $gitVersion" -ForegroundColor Green
}
catch {
    Write-Host "❌ Erro: O Git não está instalado neste computador!" -ForegroundColor Red
    Write-Host "Por favor, baixe e instale o Git de: https://git-scm.com/" -ForegroundColor Yellow
    Write-Host "Depois de instalar, feche e abra o terminal novamente e execute este script." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Pressione Enter para sair..."
    exit
}

# 2. Inicializar repositório Git se não existir
if (-not (Test-Path ".git")) {
    Write-Host "⚡ Inicializando repositório Git local..." -ForegroundColor Cyan
    git init
    git branch -M main
} else {
    Write-Host "✓ Repositório Git já inicializado localmente." -ForegroundColor Green
}

# 3. Adicionar arquivos e fazer commit
Write-Host "📦 Preparando arquivos para o commit..." -ForegroundColor Cyan
git add .

Write-Host "💾 Fazendo commit dos arquivos..." -ForegroundColor Cyan
git commit -m "feat: Landing page premium com otimizacoes completas para Mobile Safari e modal de contato" 2>$null

# 4. Perguntar URL do GitHub
Write-Host ""
Write-Host "----------------------------------------------------------" -ForegroundColor Yellow
Write-Host "Agora precisamos vincular o seu repositório do GitHub." -ForegroundColor Yellow
Write-Host "Crie um repositório VAZIO no seu GitHub (sem README, sem .gitignore)." -ForegroundColor Yellow
Write-Host "Copie a URL do repositório (ex: https://github.com/seu-usuario/seu-repositorio.git)" -ForegroundColor Yellow
Write-Host "----------------------------------------------------------" -ForegroundColor Yellow
Write-Host ""

$repoUrl = Read-Host "👉 Cole a URL do seu repositório GitHub aqui e pressione Enter"
$repoUrl = $repoUrl.Trim()

if ([string]::IsNullOrEmpty($repoUrl)) {
    Write-Host "❌ URL inválida. Abortando operação de push." -ForegroundColor Red
    Write-Host "Os arquivos foram commitados localmente. Você pode fazer o push manual depois!" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair..."
    exit
}

# 5. Configurar Remote Origin
$existingRemote = git remote get-url origin 2>$null
if ($null -ne $existingRemote) {
    Write-Host "⚡ Atualizando URL do remote origin..." -ForegroundColor Cyan
    git remote set-url origin $repoUrl
} else {
    Write-Host "⚡ Adicionando remote origin..." -ForegroundColor Cyan
    git remote add origin $repoUrl
}

# 6. Push para o GitHub
Write-Host ""
Write-Host "🚀 Enviando arquivos para o GitHub (main branch)..." -ForegroundColor Cyan
Write-Host "Nota: Se for a primeira vez, o Git abrirá uma tela para você fazer login no GitHub." -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host " 🎉 PARABÉNS! PROJETO PUBLICADO COM SUCESSO NO GITHUB! 🎉" -ForegroundColor Green
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Acesse o seu repositório no navegador para verificar!" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Ocorreu um erro ao fazer o push para o GitHub." -ForegroundColor Red
    Write-Host "Verifique se a URL está correta e se você tem permissão de escrita no repositório." -ForegroundColor Yellow
    Write-Host "Comando executado localmente de forma segura." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Pressione Enter para fechar este assistente..."
