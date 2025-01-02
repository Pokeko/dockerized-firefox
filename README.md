# Firefox in Docker (Windows)

Configuration to Run Firefox in Docker

## Prerequisites

- Docker Desktop for Windows
- Xming (X Windows server) installed

## Installation

1. Install Xming: [Download Xming](http://www.straightrunning.com/XmingNotes/)

2. Start Xming:
   - Use the default settings.
   - A Xming icon will appear in the taskbar.

## Usage

To start Firefox with a specific version:
```bash
FIREFOX_VERSION=115.0 docker compose up -d
```

Alternatively, create a `.env` file with:
```
FIREFOX_VERSION=115.0
```
Then run:
```bash
docker compose up -d
```

To stop Firefox:
```bash
docker compose down
```

## Extensions

1. Place your extension files (or other resources) in the `extensions` folder.

## Troubleshooting

If the display doesn't work:
- Check that Xming is running (look for the icon in the taskbar).
- Ensure that the Windows Firewall allows Xming.
