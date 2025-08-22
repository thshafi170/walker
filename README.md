# Walker - A Modern Application Launcher

A fast, customizable application launcher built with GTK4 and Rust, designed for Linux desktop environments. Walker provides a clean, modern interface for launching applications, running commands, performing calculations, and more.

## Features

Walker offers multiple provider types for different use cases:

- **Desktop Applications**: Launch installed GUI applications
- **Calculator**: Perform mathematical calculations with `=` prefix
- **File Browser**: Navigate and open files with `/` prefix
- **Command Runner**: Execute shell commands
- **Websearch**: Search the web with custom-defined engines
- **Clipboard History**: Access clipboard history with `:` prefix
- **Symbol Picker**: Insert special symbols with `.` prefix
- **Provider List**: Switch between providers with `;` prefix
- **Menu Integration**: Create custom menus with elephant and let walker display them
- **Dmenu**: Your good old dmenu ... with seamless menus!

## Installation

### Build from Source

```bash
# Clone the repository
git clone https://github.com/abenz1267/walker.git
cd walker

# Build with Cargo
cargo build --release

# Run Walker
./target/release/walker
```

### Install using Nix

You have two options of installing walker using Nix.

1.  Using the package exposed by this flake

    1. Add to your flake `inputs.walker.url = "github:thshafi170/walker";`
    2. Add `inputs.walker.packages.<system>.default` to `environment.systemPackages` or `home.packages`

2.  Using the home-manager module exposed by this flake:
    1. Add to your flake `inputs.walker.url = "github:thshafi170/walker";`
    2. Add `imports = [inputs.walker.homeManagerModules.default];` into your home-manager config
    3. Configure walker using:

```nix
programs.walker = {
  enable = true;
  runAsService = true;

  # All options from the config.json can be used here.
  config = {
    search.placeholder = "Example";
    ui.fullscreen = true;
    list = {
      height = 200;
    };
    websearch.prefix = "?";
    switcher.prefix = "/";
  };

  # If this is not set the default styling is used.
  theme.style = ''
    * {
      color: #dcd7ba;
    }
  '';
};
```

### Dependencies

- GTK4 (version 4.6+)
- gtk4-layer-shell
- Protocol Buffers compiler
- make sure [elephant](https://github.com/abenz1267/elephant) is running before starting Walker
- cairo
- poppler-glib

## Usage

### Basic Usage

Launch Walker with:

```bash
walker --gapplication-service
```

To open it, simply call:

```bash
walker
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Development Status

This is a beta version (1.0.0-beta) undergoing active development. Features and APIs may change before the stable 1.0 release.
