# 🚀 **TaskForge-AI — Marketplace de Agentes de IA**

TaskForge-AI é uma plataforma moderna que conecta usuários a agentes de IA personalizáveis.
O ecossistema combina um **frontend em Flutter** com um **backend em FastAPI**, oferecendo uma experiência fluida, responsiva e preparada para escalar.

---

## ✨ **Visão Geral do Projeto**

* **Frontend:** Flutter (Android, Web e Desktop)
* **Backend:** FastAPI + Python
* **Tema:** Dark modern + laranja vibrante
* **Autenticação:** JWT Persistente
* **Execução de agentes:** Workflow assíncrono
* **Objetivo:** Criar um marketplace onde cada agente tem sua própria “sala de execução” com histórico de mensagens e respostas de IA.

---

# 🧱 **Arquitetura Geral**

```
TaskForge-AI/
├── backend/
│   ├── app/
│   ├── tests/
│   ├── requirements.txt
│   └── README.md
└── frontend/
    ├── lib/
    ├── assets/
    ├── pubspec.yaml
    └── README.md
```

---

# 🔧 **Backend (FastAPI)**

### **Principais funcionalidades já implementadas**

* ✔️ CRUD de agentes
* ✔️ Execução de agentes pelo endpoint:
  `POST /agents/{agent_id}/execute`
* ✔️ Execução assíncrona com filas
* ✔️ Suporte a múltiplas filas por agente
* ✔️ JWT + Persistência
* ✔️ Integração WebSocket (opcional por enquanto)

### **Tecnologias**

* FastAPI
* Uvicorn
* MongoDB / SQLAlchemy (dependendo da versão usada)
* OpenAI / LLM Provider (pré-configurado para plugar depois)

---

# 🎨 **Frontend (Flutter)**

### **Funcionalidades já implementadas**

* ✔️ Navegação organizada com `GoRouter`
* ✔️ Tela de Home pronta
* ✔️ Lista de agentes funcionando com modelo `Agent`
* ✔️ Tela de chat funcional
* ✔️ Chamada correta do endpoint de execução
  `POST /agents/{agentId}/execute`
* ✔️ Payload correto:

  ```json
  { "message": "..." }
  ```

### **Em andamento / a ajustar**

* ⏳ Exibir loading elegante ao enviar mensagem
* ⏳ Mostrar resposta do backend no chat
* ⏳ Melhorar estilização dos cards

---

# 📦 **Instalação**

## **Backend**

```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## **Frontend**

```bash
cd frontend
flutter pub get
flutter run -d chrome
```

---

# 🧪 **Testes**

### Backend

```bash
pytest -vv
```

### Frontend

```bash
flutter test
```

---

# 🛠️ **Endpoints Principais**

### **Executar agente**

```
POST /agents/{agentId}/execute
```

**Body:**

```json
{
  "message": "sua mensagem aqui"
}
```

### **Listar agentes**

```
GET /agents
```

---

# 🗂️ **Roadmap**

### **Core**

* [ ] Finalizar chat com retorno em streaming (WebSocket)
* [ ] Gerenciamento de fila por agente
* [ ] UI da execução com animações Lottie

### **UX**

* [ ] Tela de Agent Details
* [ ] Tags, categorias e busca
* [ ] Perfil do usuário e tokens consumidos

### **Futuro**

* [ ] Marketplace com agentes pagos/gratuitos
* [ ] Upload de arquivos para análise pelos agentes
* [ ] Painel admin para monitorar execuções

---

# 👥 **Equipe & Contribuição**

Sinta-se à vontade para abrir **issues** ou **pull requests**.
O projeto é modular, claro e preparado para evolução rápida.

---

# 📄 **Licença**

MIT License — aberto para uso e modificação.

Só pedir.
