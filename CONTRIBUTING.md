# Contribuindo para asdf-coquitts

Obrigado por considerar contribuir para o plugin asdf-coquitts! Este documento fornece diretrizes para contribuições.

## 🚀 Como contribuir

### 1. Fork e Clone

1. Faça um fork do repositório
2. Clone seu fork localmente:
   ```bash
   git clone https://github.com/seu-usuario/asdf-coquitts.git
   cd asdf-coquitts
   ```

### 2. Configuração do ambiente

#### Pré-requisitos
- Go 1.21 ou superior
- Git
- Bash (para scripts)

#### Instalação local para testes
```bash
# Para asdf
asdf plugin add coquitts .
asdf install coquitts latest

# Para mise
mise plugin add coquitts .
mise install coquitts@latest
```

### 3. Desenvolvimento

#### Estrutura do projeto
```
asdf-coquitts/
├── bin/
│   ├── install      # Script de instalação
│   ├── list-all     # Lista versões disponíveis
│   └── test         # Script de teste
├── lib/
│   └── utils.bash   # Utilitários compartilhados
├── config.toml.example  # Configuração de exemplo
├── plugin.toml      # Configuração do plugin mise
├── README.md        # Documentação principal
└── CONTRIBUTING.md  # Este arquivo
```

#### Convenções de código

##### Bash scripts
- Use `set -euo pipefail` no início de todos os scripts
- Siga o estilo de indentação com 2 espaços
- Use funções para organizar código
- Documente funções com comentários

##### Go code
- Siga as convenções padrão do Go
- Use `gofmt` para formatação
- Documente funções exportadas
- Mantenha apenas dependências nativas Go

#### Testes

Execute os testes antes de submeter:
```bash
# Testa a instalação
bin/test

# Testa listagem de versões
bin/list-all

# Testa instalação local
mise install coquitts@latest
```

### 4. Commits

Siga o padrão [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Exemplos de commits
git commit -m "feat: adiciona suporte ao modelo XTTS v3"
git commit -m "fix: corrige problema de permissões no macOS"
git commit -m "docs: atualiza documentação de instalação"
git commit -m "test: adiciona testes para novos modelos"
```

Tipos de commit:
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `style`: Formatação de código
- `refactor`: Refatoração
- `test`: Testes
- `chore`: Tarefas de manutenção

### 5. Pull Request

1. Crie uma branch para sua feature:
   ```bash
   git checkout -b feature/nova-funcionalidade
   ```

2. Faça suas alterações e commits

3. Teste suas alterações:
   ```bash
   bin/test
   ```

4. Envie o PR com:
   - Descrição clara das mudanças
   - Referência a issues relacionadas
   - Exemplos de uso (se aplicável)

## 🐛 Reportando bugs

### Antes de reportar

1. Verifique se o bug já foi reportado
2. Teste com a versão mais recente
3. Colete informações do sistema:
   ```bash
   bin/test
   ```

### Template de bug report

```markdown
**Descrição do bug**
Descrição clara e concisa do problema.

**Para reproduzir**
1. Instale o plugin: `mise plugin add coquitts .`
2. Execute: `mise install coquitts@latest`
3. Tente: `tts 'teste'`
4. Veja o erro

**Comportamento esperado**
O que deveria acontecer.

**Informações do sistema**
- OS: macOS/Linux/Windows
- Versão: 12.0/Ubuntu 22.04/etc
- Go: 1.21.0
- asdf/mise: versão

**Logs**
Cole os logs de erro aqui.

**Contexto adicional**
Qualquer informação adicional relevante.
```

## 💡 Sugerindo melhorias

### Template de feature request

```markdown
**Problema**
Descrição do problema que a feature resolveria.

**Solução proposta**
Descrição da solução desejada.

**Alternativas consideradas**
Outras soluções que você considerou.

**Contexto adicional**
Qualquer contexto adicional.
```

## 📋 Checklist para PRs

- [ ] Código segue as convenções do projeto
- [ ] Testes passam localmente
- [ ] Documentação foi atualizada
- [ ] Commits seguem Conventional Commits
- [ ] PR tem descrição clara
- [ ] Não quebra compatibilidade

## 🏷️ Releases

### Processo de release

1. Atualize a versão em `plugin.toml`
2. Atualize o CHANGELOG.md
3. Crie uma tag:
   ```bash
   git tag v0.2.0
   git push origin v0.2.0
   ```

### Versionamento

Seguimos [Semantic Versioning](https://semver.org/):
- `MAJOR.MINOR.PATCH`
- `MAJOR`: Mudanças incompatíveis
- `MINOR`: Novas funcionalidades compatíveis
- `PATCH`: Correções de bugs compatíveis

## 🤝 Comunidade

### Canais de comunicação
- Issues do GitHub para bugs e features
- Discussions para perguntas gerais
- Pull Requests para contribuições

### Código de conduta
- Seja respeitoso e inclusivo
- Ajude outros contribuidores
- Mantenha discussões construtivas

## 📚 Recursos úteis

- [Documentação do asdf](https://asdf-vm.com/guide/getting-started.html)
- [Documentação do mise](https://mise.jdx.dev/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Coqui-TTS Documentation](https://tts.readthedocs.io/)

## 🙏 Agradecimentos

Obrigado por contribuir para tornar o Coqui-TTS mais acessível através do asdf/mise!
