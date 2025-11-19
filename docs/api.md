# Orbital CLI API Documentation

This document describes the API endpoints used by the Orbital CLI application.

## Authentication Endpoints

### Device Authorization

#### Request Device Code
```
POST /api/auth/device
```

**Request Body:**
```json
{
  "client_id": "string",
  "scope": "string"
}
```

**Response:**
```json
{
  "device_code": "string",
  "user_code": "string",
  "verification_uri": "string",
  "verification_uri_complete": "string",
  "expires_in": "number",
  "interval": "number"
}
```

#### Exchange Device Code for Token
```
POST /api/auth/device/token
```

**Request Body:**
```json
{
  "grant_type": "urn:ietf:params:oauth:grant-type:device_code",
  "device_code": "string",
  "client_id": "string"
}
```

**Response:**
```json
{
  "access_token": "string",
  "token_type": "string",
  "expires_in": "number",
  "refresh_token": "string",
  "scope": "string"
}
```

### Session Management

#### Get Current User Session
```
GET /api/me
Headers: Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "user": {
    "id": "string",
    "name": "string",
    "email": "string",
    "image": "string"
  },
  "session": {
    "id": "string",
    "expiresAt": "date"
  }
}
```

#### Get Session by Access Token
```
GET /api/me/:access_token
```

**Response:**
```json
{
  "user": {
    "id": "string",
    "name": "string",
    "email": "string",
    "image": "string"
  },
  "session": {
    "id": "string",
    "expiresAt": "date"
  }
}
```

### Device Flow Redirection

#### Redirect to Device Page
```
GET /device?user_code=:user_code
```

Redirects to the client-side device authorization page.

## Chat Endpoints

### Conversations

#### Create Conversation
```
POST /api/conversations
Headers: Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "mode": "chat|tool|agent",
  "title": "string (optional)"
}
```

**Response:**
```json
{
  "id": "string",
  "userId": "string",
  "title": "string",
  "mode": "string",
  "createdAt": "date",
  "updatedAt": "date"
}
```

#### Get User Conversations
```
GET /api/conversations
Headers: Authorization: Bearer <access_token>
```

**Response:**
```json
[
  {
    "id": "string",
    "userId": "string",
    "title": "string",
    "mode": "string",
    "createdAt": "date",
    "updatedAt": "date",
    "messages": [
      {
        "id": "string",
        "role": "string",
        "content": "string",
        "createdAt": "date"
      }
    ]
  }
]
```

#### Get Conversation by ID
```
GET /api/conversations/:id
Headers: Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "id": "string",
  "userId": "string",
  "title": "string",
  "mode": "string",
  "createdAt": "date",
  "updatedAt": "date",
  "messages": [
    {
      "id": "string",
      "role": "string",
      "content": "string",
      "createdAt": "date"
    }
  ]
}
```

#### Update Conversation Title
```
PUT /api/conversations/:id
Headers: Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "title": "string"
}
```

**Response:**
```json
{
  "id": "string",
  "userId": "string",
  "title": "string",
  "mode": "string",
  "createdAt": "date",
  "updatedAt": "date"
}
```

#### Delete Conversation
```
DELETE /api/conversations/:id
Headers: Authorization: Bearer <access_token>
```

**Response:**
```json
{
  "success": true
}
```

### Messages

#### Add Message to Conversation
```
POST /api/conversations/:id/messages
Headers: Authorization: Bearer <access_token>
```

**Request Body:**
```json
{
  "role": "user|assistant|system|tool",
  "content": "string"
}
```

**Response:**
```json
{
  "id": "string",
  "conversationId": "string",
  "role": "string",
  "content": "string",
  "createdAt": "date"
}
```

#### Get Conversation Messages
```
GET /api/conversations/:id/messages
Headers: Authorization: Bearer <access_token>
```

**Response:**
```json
[
  {
    "id": "string",
    "conversationId": "string",
    "role": "string",
    "content": "string",
    "createdAt": "date"
  }
]
```

## Error Responses

All endpoints may return the following error responses:

```json
{
  "error": "string",
  "message": "string",
  "details": "string (optional)"
}
```

Common HTTP status codes:
- 200: Success
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 500: Internal Server Error