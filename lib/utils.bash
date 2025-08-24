#!/usr/bin/env bash

# Utilitários para o plugin asdf-coquitts

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para log colorido
log_info() {
    echo -e "${BLUE}>>>${NC} $1"
}

log_success() {
    echo -e "${GREEN}>>>${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}>>>${NC} $1"
}

log_error() {
    echo -e "${RED}>>>${NC} $1"
}

# Função para verificar se Python está instalado
check_python() {
    if ! command -v python3 &> /dev/null; then
        log_error "Python 3 não está instalado. Por favor, instale Python 3 primeiro."
        log_info "Visite: https://www.python.org/downloads/"
        return 1
    fi
    return 0
}

# Função para obter a versão do Python
get_python_version() {
    if command -v python3 &> /dev/null; then
        python3 --version | cut -d' ' -f2
    else
        echo "not installed"
    fi
}

# Função para verificar se pip está instalado
check_pip() {
    if ! command -v pip3 &> /dev/null; then
        log_error "pip3 não está instalado. Por favor, instale pip3 primeiro."
        return 1
    fi
    return 0
}

# Função para verificar se git está instalado
check_git() {
    if ! command -v git &> /dev/null; then
        log_error "Git não está instalado. Por favor, instale Git primeiro."
        return 1
    fi
    return 0
}

# Função para criar diretórios necessários
create_directories() {
    local install_path="$1"
    mkdir -p "$install_path/bin"
    mkdir -p "${HOME}/.local/share/mise/coquitts-models"
    mkdir -p "${HOME}/.config/coquitts"
}

# Função para limpar arquivos temporários
cleanup_temp() {
    local temp_dir="$1"
    if [ -n "$temp_dir" ] && [ -d "$temp_dir" ]; then
        rm -rf "$temp_dir"
    fi
}

# Função para validar versão
validate_version() {
    local version="$1"
    if [ -z "$version" ]; then
        log_error "Versão não especificada"
        return 1
    fi
    return 0
}

# Função para detectar sistema operacional
detect_os() {
    case "$(uname -s)" in
        Darwin*)    echo "macos";;
        Linux*)     echo "linux";;
        CYGWIN*)    echo "windows";;
        MINGW*)     echo "windows";;
        *)          echo "unknown";;
    esac
}

# Função para detectar arquitetura
detect_arch() {
    case "$(uname -m)" in
        x86_64)     echo "amd64";;
        aarch64)    echo "arm64";;
        armv7l)     echo "armv7";;
        *)          echo "unknown";;
    esac
}

# Função para verificar conectividade com GitHub
check_github_connectivity() {
    if ! curl -s --connect-timeout 5 https://github.com > /dev/null; then
        log_error "Não foi possível conectar ao GitHub"
        return 1
    fi
    return 0
}

# Função para mostrar informações do sistema
show_system_info() {
    log_info "Informações do sistema:"
    log_info "  OS: $(detect_os)"
    log_info "  Arch: $(detect_arch)"
    log_info "  Python: $(get_python_version)"
    log_info "  Git: $(git --version 2>/dev/null || echo 'not installed')"
}

# Função para configurar trap para limpeza
setup_cleanup_trap() {
    local temp_dir="$1"
    trap "cleanup_temp '$temp_dir'" EXIT
}

# Função para verificar permissões de escrita
check_write_permissions() {
    local path="$1"
    if [ ! -w "$(dirname "$path")" ]; then
        log_error "Sem permissão de escrita em: $(dirname "$path")"
        return 1
    fi
    return 0
}
