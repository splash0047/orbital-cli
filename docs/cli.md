# Orbital CLI Commands Documentation

This document describes all available commands in the Orbital CLI tool.

## Installation

To install the CLI globally:

```bash
cd server
npm install -g .
```

Or run directly without installation:

```bash
cd server
npm run cli [command]
```

## Available Commands

### `login`
Authenticate with the Orbital CLI using device flow authentication.

```bash
orbit login [options]
```

**Options:**
- `--server-url <url>`: The authentication server URL (default: http://localhost:3005)
- `--client-id <id>`: The OAuth client ID (default: from environment variables)
- `-h, --help`: Display help for command

**Description:**
Initiates the device flow authentication process. The CLI will request a device code from the server, display it to the user, and provide a URL to visit in a browser. After authenticating and approving the device on the web interface, the CLI will automatically receive an access token and store it for future use.

### `logout`
Clear stored authentication credentials.

```bash
orbit logout
```

**Description:**
Removes the locally stored access token, effectively logging the user out. No options are available for this command.

### `whoami`
Display information about the currently authenticated user.

```bash
orbit whoami [options]
```

**Options:**
- `--server-url <url>`: The authentication server URL (default: http://localhost:3005)
- `-h, --help`: Display help for command

**Description:**
Shows details about the currently authenticated user, including name, email, and user ID.

### `wakeup`
Start an AI chat session.

```bash
orbit wakeup
```

**Description:**
Initiates an interactive AI chat session. Users can choose between three modes:
1. Simple chat
2. Tool calling (with access to tools like web search)
3. Agentic mode (advanced AI workflows)

### `help`
Display help information for commands.

```bash
orbit help [command]
```

**Description:**
Shows help information for the specified command or general help if no command is specified.

## Authentication Flow

1. Run `orbit login`
2. The CLI displays a device code and verification URL
3. User visits the URL and enters the device code
4. User authenticates and approves the device
5. CLI automatically receives and stores the access token
6. User can now use other commands that require authentication

## Chat Modes

### Simple Chat
Basic conversation with the AI assistant without any special tools or capabilities.

### Tool Calling
Enhanced chat mode where the AI can use tools such as:
- Web search
- Code execution
- File operations (planned)

### Agentic Mode
Advanced mode where the AI can perform complex tasks through multiple steps and tool interactions.

## Configuration Files

The CLI stores configuration and authentication tokens in:
- **Location**: `~/.better-auth/`
- **Token file**: `token.json`

This file contains the access token, refresh token, and metadata about the authentication session.

## Environment Variables

The CLI uses the following environment variables:

- `GOOGLE_GENERATIVE_AI_API_KEY`: Required for AI functionality
- `GITHUB_CLIENT_ID`: Required for GitHub authentication
- `GITHUB_CLIENT_SECRET`: Required for GitHub authentication
- `DATABASE_URL`: Required for database connectivity

These can be set in a `.env` file in the server directory.

## Examples

### Basic Authentication
```bash
# Start the authentication process
orbit login

# Check who is authenticated
orbit whoami

# Log out
orbit logout
```

### Starting a Chat Session
```bash
# Start AI chat
orbit wakeup

# Choose a mode when prompted:
# 1. Simple chat
# 2. Tool calling
# 3. Agentic mode
```

## Troubleshooting

### Authentication Issues
- Ensure the server is running at the specified URL
- Verify the client ID is correct
- Check that the device code hasn't expired (typically 30 minutes)

### Chat Issues
- Ensure the Google AI API key is set correctly
- Check internet connectivity
- Verify the selected AI model is available

### Token Issues
- If experiencing authentication problems, try logging out and logging back in
- Check that the `~/.better-auth/` directory is writable