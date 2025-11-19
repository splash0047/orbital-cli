# Orbital CLI - AI-Powered Command Line Interface

Orbital CLI is a cutting-edge command-line interface that combines secure device-flow authentication with powerful AI capabilities. Built with modern technologies, it offers a seamless experience for interacting with AI models directly from your terminal.

## 🌟 Features

- 🔐 **Secure Device Flow Authentication**: OAuth-based authentication using device codes
- 🤖 **AI Chat Integration**: Powered by Google Gemini AI models
- 💬 **Multiple Interaction Modes**: 
  - Simple chat
  - Tool calling (search, code execution)
  - Agentic workflows (coming soon)
- 💾 **Persistent Conversations**: Save and resume chat histories
- 🌐 **Web-Based Authorization**: Secure web interface for device approval
- 🎨 **Beautiful CLI Interface**: Rich terminal UI with spinners, colors, and prompts

## 📁 Project Structure

```
orbital-cli/
├── client/           # Next.js web interface for authentication
│   ├── app/          # Pages (device auth, approval, dashboard)
│   ├── components/   # Reusable UI components
│   └── lib/          # Client-side utilities
├── server/           # Node.js backend and CLI implementation
│   ├── src/
│   │   ├── cli/      # CLI commands and chat interfaces
│   │   ├── config/   # Configuration files
│   │   ├── lib/      # Authentication and database utilities
│   │   └── services/ # Business logic services
│   └── prisma/       # Database migrations and schema
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Node.js (v18 or higher)
- PostgreSQL database
- Google AI API key
- GitHub OAuth App (for social authentication)

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/splash0047/orbital-cli.git
cd orbital-cli
```

2. **Install server dependencies:**
```bash
cd server
npm install
npm run dev
```

3. **Install client dependencies:**
```bash
cd ../client
npm install
npm run dev
```

### Environment Setup

#### Server Environment Variables
Create a `.env` file in the `server/` directory:

```env
# Database
DATABASE_URL="postgresql://USER:PASSWORD@HOST:PORT/DATABASE"

# Google AI
GOOGLE_GENERATIVE_AI_API_KEY="your-google-ai-api-key"

# GitHub OAuth (optional)
GITHUB_CLIENT_ID="your-github-client-id"
GITHUB_CLIENT_SECRET="your-github-client-secret"
```

#### Client Environment Variables
Create a `.env.local` file in the `client/` directory:

```env
NEXT_PUBLIC_BASE_URL="http://localhost:3005"
```

### Database Setup

1. **Run Prisma migrations:**
```bash
cd server
npx prisma migrate dev
```

2. **Generate Prisma client:**
```bash
npx prisma generate
```

## ▶️ Running the Application

### Start the Server

```bash
cd server
npm run dev
```

The server will start on port 3005.

### Start the Client

```bash
cd client
npm run dev
```

The client will start on port 3000.

### Using the CLI

From the server directory:

```bash
# Login via device flow
npm run cli login

# Start AI chat
npm run cli wakeup

# View current user
npm run cli whoami

# Logout
npm run cli logout
```

Or use the global command after installation:

```bash
npm install -g .
orbit login
orbit wakeup
```

## 🖼️ Screenshots

### 1. CLI Login Process
![CLI Login](screenshots/cli-login.png)

### 2. Device Authorization Web Interface
![Device Auth](screenshots/device-auth.png)

### 3. Device Approval Screen
![Device Approval](screenshots/device-approval.png)

### 4. CLI Chat Interface
![CLI Chat](screenshots/cli-chat.png)

### 5. Web Dashboard
![Web Dashboard](screenshots/web-dashboard.png)

## 🛠️ Development

### Project Commands

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server |
| `npm run cli` | Run CLI tool |
| `npm run orbit` | Alias for CLI tool |

### Folder Structure Details

#### Server (`server/src/`)
- `cli/`: Contains all CLI-related code
  - `commands/`: Individual CLI commands
  - `chat/`: AI chat implementations
  - `ai/`: AI service integrations
- `lib/`: Core utilities (auth, database)
- `services/`: Business logic
- `config/`: Configuration files

#### Client (`client/app/`)
- `auth/`: Authentication pages
- `device/`: Device authorization page
- `approve/`: Device approval page
- `page.tsx`: Main dashboard

## 🔧 Configuration

### AI Model Settings
Modify `server/src/config/google.config.js` to change:
- AI model selection
- Temperature settings
- Max tokens

### Authentication Settings
Adjust settings in `server/src/lib/auth.js`:
- Social providers
- Device flow configuration
- Session settings

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [better-auth](https://www.better-auth.com/) for authentication
- [Vercel AI SDK](https://sdk.vercel.ai/docs) for AI integration
- [Google AI](https://ai.google.dev/) for Gemini models

- [Commander.js](https://github.com/tj/commander.js/) for CLI framework

