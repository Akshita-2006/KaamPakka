# Nivara

**Nivara is an AI-guided care marketplace that helps people understand a medical bill, review transparent lower-cost options, choose a fulfilment offer, and approve a PayPal checkout.**

> Built for the PayPal AI Hackathon. Nivara is a functional prototype—not medical advice, a prescription service, or a live pharmacy marketplace.

## Why Nivara

Healthcare purchases are often made under pressure, with opaque pricing and little time to compare options. Nivara creates a deliberate decision moment before payment:

1. Read a bill or prescription with OCR.
2. Use Gemini-assisted analysis and price-reference matching to prepare a conservative care plan.
3. Show transparent demo merchant offers: price, delivery promise, and rationale.
4. Require explicit user approval before creating a PayPal order.
5. Capture the approved payment through PayPal Sandbox and retain an event record.

The AI assists with understanding and comparison. It does **not** autonomously purchase medicine or replace a qualified provider.

## Product walkthrough

| Step | User outcome | Technology |
| --- | --- | --- |
| Upload | Upload a bill image or PDF | Flask, Tesseract, PDF extraction |
| Review | Confirm OCR quantities and extracted items | Jinja + browser UI |
| Plan | View high/medium-confidence reference-priced options | Gemini or local parsing fallback |
| Choose | Compare transparent merchant offers | deterministic marketplace logic |
| Pay | Approve and complete an order | PayPal Orders v2 + JavaScript SDK |
| Operate | Inspect offer performance | AG Grid merchant workspace |

## PayPal integration

Nivara uses the PayPal Orders v2 flow:

- The browser only receives the public `PAYPAL_CLIENT_ID` required by the PayPal JavaScript SDK.
- The Flask server exchanges the **secret** for an access token, creates the order, and captures it after approval.
- Each order is linked to the originating care plan and selected demo merchant in SQLite.
- Sandbox is the default and recommended hackathon mode. No real payment is processed in Sandbox.

The visible merchant offers are deliberately marked as demo data. They represent a future marketplace experience; the PayPal checkout is processed by the single configured PayPal Sandbox business account.

## AI integration

When `GOOGLE_API_KEY` is configured, Gemini helps transform OCR text into structured care evidence and a cautious bill analysis. The application then filters out low-confidence items before it creates a checkout-eligible plan. If Gemini is unavailable, rule-based parsing keeps the prototype runnable.

## Quick start

### 1. Create and activate a virtual environment

```bash
python -m venv venv
```

Windows PowerShell:

```powershell
.\venv\Scripts\Activate.ps1
```

macOS/Linux:

```bash
source venv/bin/activate
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Configure environment variables

Copy `.env.example` to `.env` and fill the values:

```powershell
Copy-Item .env.example .env
```

Minimum local configuration:

```env
SECRET_KEY=generate-a-long-random-value
PAYPAL_ENV=sandbox
PAYPAL_CLIENT_ID=your-sandbox-client-id
PAYPAL_CLIENT_SECRET=your-sandbox-client-secret
PAYPAL_CURRENCY=INR
GOOGLE_API_KEY=your-gemini-key
```

Create a PayPal developer app, then use its **Sandbox** client ID and secret. Keep the secret in `.env`; do not commit it or paste it into a frontend file.

Optional OCR configuration on Windows:

```env
TESSERACT_CMD=C:\Program Files\Tesseract-OCR\tesseract.exe
```

### 4. Run

```bash
python app.py
```

Open [http://127.0.0.1:5000](http://127.0.0.1:5000).

## Demo flow for judges

1. Create an account and sign in.
2. Upload a clear sample medical bill or prescription.
3. Review the OCR-detected quantities, then continue to the evidence screen.
4. Select **Build care plan**.
5. Compare the merchant cards, acknowledge the care-plan disclaimer, and use the PayPal Sandbox button.
6. Log in with a PayPal Sandbox personal buyer account to approve payment.
7. Return to the Nivara payment event log and open **Merchant workspace** to inspect the AG Grid operations table.

If no high- or medium-confidence medicine matches are present, the care-plan checkout intentionally remains unavailable. This is a safety guard, not a broken checkout.

## Architecture

```text
Browser → Flask routes → OCR / Gemini analysis → care-plan guardrails
                                           ↓
                              transparent demo merchant offers
                                           ↓
PayPal JS SDK ← server-side Orders v2 create & capture ← PayPal Sandbox
                                           ↓
                              SQLite payment event record
```

## Environment variables

| Variable | Required | Purpose |
| --- | --- | --- |
| `SECRET_KEY` | Yes | Signs Flask sessions and CSRF state |
| `GOOGLE_API_KEY` | Recommended | Enables Gemini-assisted analysis and chat |
| `PAYPAL_CLIENT_ID` | For checkout | Loads the PayPal JavaScript SDK |
| `PAYPAL_CLIENT_SECRET` | For checkout | Server-only Orders v2 authentication |
| `PAYPAL_ENV` | No | `sandbox` by default; use `live` only after proper merchant setup |
| `PAYPAL_CURRENCY` | No | Checkout currency; defaults to `INR` |
| `TESSERACT_CMD` | Windows-dependent | Path to the Tesseract executable |
| `DATABASE_PATH` | No | SQLite path; defaults to local `users.db` |
| `BREVO_*` | No | Optional email OTP and contact-form delivery |

## Deployment

The repository includes a Dockerfile and Procfile suitable for Railway. Use a persistent volume and configure:

```env
DATABASE_PATH=/data/users.db
```

After deployment, use `/api/status` as a basic health check. Configure PayPal Sandbox credentials in the host's secret environment variables, never in Git.

## Safety and prototype boundaries

- OCR, AI extraction, and reference-price matching can be wrong. Users must review every item.
- Nivara does not diagnose, prescribe, or confirm medical substitutions.
- Demo merchant cards are not live pharmacy inventory or delivery commitments.
- A production multi-merchant product would require seller onboarding, marketplace agreements, real inventory, regulatory review, and live PayPal platform approval.

## Stack

Python, Flask, SQLite, Tesseract, Gemini, PayPal Orders v2, PayPal JavaScript SDK, AG Grid Community, HTML/CSS/JavaScript.

## Builder

Akshita Sachdeva
