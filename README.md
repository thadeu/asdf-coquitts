# asdf-coquitts

Plugin for [asdf](https://asdf-vm.com/) and [mise](https://mise.jdx.dev/) that installs [Coqui-TTS](https://github.com/coqui-ai/TTS) - an open-source text-to-speech toolkit with state-of-the-art models.

## 📋 Prerequisites

### System Dependencies

#### macOS
```bash
# Install Python 3 (required for Coqui-TTS)
# Note: Coqui-TTS 0.22.0 requires Python 3.9-3.11
# For Python 3.13+, use latest version

# Install Python 3.11 (recommended)
brew install python@3.11

# Or install latest Python 3
brew install python3

# Or via MacPorts
sudo port install python311
```

#### Ubuntu/Debian
```bash
# Update repositories
sudo apt update

# Install Python 3.11 (recommended for Coqui-TTS)
sudo apt install -y python3.11 python3.11-pip python3.11-venv curl

# Or install latest Python version
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.11 python3.11-pip python3.11-venv

# Set Python 3.11 as default
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
```

#### Other Linux distributions
```bash
# Fedora/RHEL/CentOS
sudo dnf install python3 python3-pip python3-venv curl

# Arch Linux
sudo pacman -S python python-pip curl
```

## 🚀 Installation

### Install the plugin

#### For ASDF:
```bash
asdf plugin add coquitts https://github.com/thadeu/asdf-coquitts.git
```

#### For MISE:
```bash
mise plugin add coquitts https://github.com/thadeu/asdf-coquitts.git
```

### Install Coqui-TTS

```bash
# Install latest version
asdf install coquitts latest
# or
mise install coquitts@latest

# Install specific version
asdf install coquitts v0.22.0
# or
mise install coquitts@v0.22.0

# Set as global version
asdf global coquitts latest
# or
mise use -g coquitts@latest
```

## 📦 What gets installed

The plugin installs:

- **`coquitts`** - Main Python interface for Coqui-TTS
- **`tts`** - User-friendly wrapper with simplified interface
- **`activate`** - Script to activate the Python virtual environment

## 🎯 How it works

### Python-based implementation

This plugin provides a Python-based implementation of Coqui-TTS functionality:

- Uses the official Coqui-TTS Python library
- Cross-platform compatibility
- Full access to all Coqui-TTS features
- Virtual environment isolation

### Model management

Models are managed through the Coqui-TTS ecosystem:

- Models are downloaded automatically when needed
- Stored in the Coqui-TTS cache directory
- Supports all Coqui-TTS model formats
- Full access to Hugging Face model hub

## 💻 Usage examples

### Basic text-to-speech
```bash
# Simple text conversion
tts "Olá mundo"

# Specify language
tts -l en "Hello world"
tts -l es "Hola mundo"
```

### Output options
```bash
# Custom output file
tts -o meu_audio.wav "Texto para converter"

# Different formats
tts -o audio.mp3 "Texto em MP3"
tts -o speech.flac "Texto em FLAC"
```

### Model selection
```bash
# Use specific model
tts -m tts_models/multilingual/multi-dataset/xtts_v2 "Texto multilíngue"
tts -m tts_models/pt/cv/vits "Texto em português"
tts -m tts_models/en/ljspeech/fast_pitch "English text"

# List available models
tts --list-models

# Get model info
coquitts --model_info_by_name "tts_models/multilingual/multi-dataset/xtts_v2"

# List models by type
coquitts --list_models | grep "tts_models"
coquitts --list_models | grep "vocoder_models"
```

### Speaker selection
```bash
# Use specific speaker (if model supports it)
tts -s "path/to/speaker.wav" "Texto com voz específica"

# Voice cloning with XTTS v2
tts -m tts_models/multilingual/multi-dataset/xtts_v2 -s "speaker.wav" "Texto clonado"
```

### Advanced usage
```bash
# Multiple options
tts -l pt -m your_tts -o apresentacao.wav -s "speaker.wav" "Bem-vindos à apresentação"

# Batch processing (using shell)
for text in "Primeira frase" "Segunda frase" "Terceira frase"; do
    tts -o "${text// /_}.wav" "$text"
done

# Voice conversion
coquitts --model_name voice_conversion_models/multilingual/vctk/freevc24 \
         --source_wav "source.wav" --target_wav "target.wav" --out_path "converted.wav"
```

### Using the Python interface directly
```bash
# Direct usage of the Python interface
coquitts --text "Texto direto" --model_name tts_models/multilingual/multi-dataset/xtts_v2 --out_path audio.wav

# Show help
coquitts --help

# Activate virtual environment
source ~/.local/share/mise/installs/coquitts/latest/bin/activate
python -m TTS.cli --text "teste" --model_name tts_models/multilingual/multi-dataset/xtts_v2
```

## 🎵 Supported models

### Downloading models

Models are downloaded automatically on first use:

```bash
# First use - model will be downloaded automatically
tts -m tts_models/multilingual/multi-dataset/xtts_v2 "Olá mundo"

# Check downloaded models
ls -la ~/.local/share/tts/tts_models/

# List available models
tts --list-models
```

### Multilingual models
- `tts_models/multilingual/multi-dataset/xtts_v2` - XTTS v2 (requires license confirmation, ~2.5 GB)
- `tts_models/multilingual/multi-dataset/your_tts` - YourTTS (~1.8 GB)

### Default models (no license required)
- `tts_models/en/ljspeech/tacotron2-DDC` - English Tacotron2 (default, ~150 MB)
- `tts_models/en/ljspeech/fast_pitch` - English FastPitch (~150 MB)

### Language-specific models
- `tts_models/pt/cv/vits` - Portuguese (Common Voice, ~200 MB)
- `tts_models/en/ljspeech/tacotron2-DDC` - English (LJSpeech, ~150 MB)
- `tts_models/en/ljspeech/fast_pitch` - English (FastPitch, ~150 MB)
- `tts_models/es/css10/vits` - Spanish (CSS10, ~200 MB)

### Voice cloning models
- `tts_models/multilingual/multi-dataset/xtts_v2` - XTTS v2 voice cloning (recommended)
- `tts_models/multilingual/multi-dataset/your_tts` - YourTTS voice cloning

### Voice conversion models
- `voice_conversion_models/multilingual/vctk/freevc24` - FreeVC voice conversion
- `voice_conversion_models/multilingual/vctk/your_tts` - YourTTS voice conversion

### Fairseq models (1100+ languages)
- `tts_models/<lang-iso>/fairseq/vits` - Fairseq VITS models
- Example: `tts_models/pt/fairseq/vits` for Portuguese

## 🌍 Supported languages

The plugin supports all languages available in Coqui-TTS:

- **Portuguese (pt)** - Default language
- **English (en)** - Full support
- **Spanish (es)** - Full support
- **French (fr)** - Full support
- **German (de)** - Full support
- **Italian (it)** - Full support
- **And many more...**

## 📁 File structure

```
~/.local/share/mise/installs/coquitts/latest/
├── bin/
│   ├── coquitts          # Main Python interface
│   ├── tts              # Simplified wrapper
│   └── activate         # Virtual environment activator
├── venv/                # Python virtual environment
│   ├── bin/
│   ├── lib/
│   └── ...
└── ...

# Coqui-TTS cache directory (created automatically)
~/.local/share/tts/
├── tts_models/          # Downloaded models
│   ├── multilingual/
│   │   └── multi-dataset/
│   │       ├── xtts_v2/     (~2.5 GB)
│   │       └── your_tts/    (~1.8 GB)
│   ├── pt/
│   │   └── cv/
│   └── en/
│       └── ljspeech/
├── vocoder_models/      # Vocoder models
└── voice_conversion_models/  # Voice conversion models
```

## 💾 Model Management

### Check disk space
```bash
# Check total size of models
du -sh ~/.local/share/tts/

# Check individual model sizes
du -sh ~/.local/share/tts/tts_models/*

# Check available disk space
df -h ~/.local/share/tts/
```

### Remove unused models
```bash
# Remove specific model
rm -rf ~/.local/share/tts/tts_models/multilingual/multi-dataset/your_tts

# Remove all models (careful!)
rm -rf ~/.local/share/tts/tts_models/
```

## 🔧 Configuration

### Environment variables
```bash
# Set default language
export COQUITTS_DEFAULT_LANGUAGE=pt

# Set default model
export COQUITTS_DEFAULT_MODEL=tts_models/multilingual/multi-dataset/xtts_v2

# Set output directory
export COQUITTS_OUTPUT_DIR=~/Audio
```

### Configuration file
Create `~/.config/coquitts/config.toml`:
```toml
[defaults]
language = "pt"
model = "tts_models/multilingual/multi-dataset/xtts_v2"
output_dir = "~/Audio"

[models]
# Custom model paths
custom_model_1 = "/path/to/custom/model"
```

## 🐛 Troubleshooting

### Python version compatibility
```bash
# Check your Python version
python3 --version

# Use the compatibility checker
bin/check-compatibility

# Coqui-TTS version compatibility:
# - 0.22.0: Python 3.9-3.11
# - 0.23.0+: Python 3.9-3.13+
# - Latest: Usually supports newest Python versions

# If you have Python 3.13+ and get compatibility errors:
mise install coquitts@latest  # Use latest version
```

### Python not found
```bash
# Check Python installation
python3 --version

# Install Python if missing
# macOS: brew install python3
# Ubuntu: sudo apt install python3 python3-pip python3-venv
# Or download from: https://www.python.org/downloads/
```

### Model download issues
```bash
# Check internet connection
curl -I https://huggingface.co/coqui/XTTS-v2

# Models are downloaded automatically on first use
tts -m tts_models/multilingual/multi-dataset/xtts_v2 "Test"

# Check downloaded models
ls -la ~/.local/share/tts/tts_models/

# Clear cache and retry if download fails
rm -rf ~/.local/share/tts/tts_models/multilingual/multi-dataset/xtts_v2
tts -m tts_models/multilingual/multi-dataset/xtts_v2 "Test"

# Manual download via Python
source ~/.local/share/mise/installs/coquitts/latest/bin/activate
python -c "from TTS.api import TTS; tts = TTS('tts_models/multilingual/multi-dataset/xtts_v2')"
```

### Permission issues
```bash
# Check permissions
ls -la ~/.local/share/mise/installs/coquitts/latest/

# Fix permissions
chmod 755 ~/.local/share/mise/installs/coquitts/latest/bin/

# Check virtual environment
ls -la ~/.local/share/mise/installs/coquitts/latest/venv/
```

### Performance optimization
```bash
# Use faster models for real-time applications
tts -m tts_models/en/ljspeech/fast_pitch "Fast synthesis"

# Use GPU acceleration (if available)
# Note: This requires additional setup with CUDA/OpenCL
```

## 🔄 Using the Python Environment

For advanced features, you can activate the Python virtual environment:

```bash
# Activate the virtual environment
source ~/.local/share/mise/installs/coquitts/latest/bin/activate

# Use Python TTS directly
python -m TTS.cli --text "Texto" --model_name tts_models/multilingual/multi-dataset/xtts_v2

# Install additional packages (PyTorch with CUDA support)
pip install torch torchaudio --index-url https://download.pytorch.org/whl/cu118

# Use GPU acceleration (if available)
export CUDA_VISIBLE_DEVICES=0

# Deactivate when done
deactivate
```

### Advanced Python Usage

```python
# Example Python script
from TTS.api import TTS

# Initialize TTS
tts = TTS("tts_models/multilingual/multi-dataset/xtts_v2")

# Generate speech
tts.tts_to_file(
    text="Olá mundo!",
    speaker_wav="speaker.wav",
    language="pt",
    file_path="output.wav"
)
```

## 📚 Additional resources

- [Official Coqui-TTS documentation](https://tts.readthedocs.io/)
- [Available models on Hugging Face](https://huggingface.co/coqui)
- [XTTS v2 model](https://huggingface.co/coqui/XTTS-v2)
- [YourTTS model](https://huggingface.co/coqui/your_tts)
- [Performance tuning guide](https://tts.readthedocs.io/en/latest/inference.html)

## 🤝 Contributing

Contributions are welcome! Please open an issue or pull request.

### Development setup
```bash
# Clone the repository
git clone https://github.com/thadeu/asdf-coquitts.git
cd asdf-coquitts

# Test the plugin
mise plugin add coquitts .
mise install coquitts@latest
```

## 📄 License

This project is licensed under the same license as Coqui-TTS (MIT License).