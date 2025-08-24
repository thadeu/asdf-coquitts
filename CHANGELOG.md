# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Added
- Suporte inicial ao Coqui-TTS
- Instalação Python com ambiente virtual
- Wrapper `tts` com interface amigável
- Suporte a múltiplos idiomas
- Gerenciamento automático de modelos
- Scripts de instalação e teste
- Documentação completa
- Configuração via arquivo TOML
- Utilitários para desenvolvimento
- Script de ativação do ambiente virtual
- Listagem de versões via PyPI

### Changed
- Convertido de whisper.cpp para Coqui-TTS
- Implementação em Python usando a biblioteca oficial
- Interface simplificada para usuários
- Instalação via pip em vez de repositório Git
- Remoção de dependência do Git

### Fixed
- Erro de checkout de versão inexistente no Git
- Problemas com tags e branches do repositório
- Instalação mais robusta e confiável

### Fixed
- N/A

### Removed
- Dependências do whisper.cpp
- Binários whisper-cli e whisper-server

## [0.1.0] - 2024-01-XX

### Added
- Versão inicial do plugin asdf-coquitts
- Suporte ao asdf e mise
- Instalação automática de dependências
- Scripts de instalação e listagem de versões
- Documentação básica

---

## Tipos de mudanças

- **Added** para novas funcionalidades
- **Changed** para mudanças em funcionalidades existentes
- **Deprecated** para funcionalidades que serão removidas
- **Removed** para funcionalidades removidas
- **Fixed** para correções de bugs
- **Security** para vulnerabilidades corrigidas
