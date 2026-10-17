# KaamPakka

KaamPakka is an AI-guided repair-request desk. It turns a repair quote, invoice, photo, or written issue into a clear job brief and transparent technician terms before a buyer-approved PayPal booking deposit.

Built for the PayPal AI Hackathon.

**Built by Akshita Sachdeva**

## Why it exists

Repair bookings are often fragmented: buyers compare messages, verbal quotes, availability promises, and payment links with little context. KaamPakka makes the job scope, visit fee, parts cap, arrival window, and warranty terms readable before money moves. The buyer chooses the technician and approves every payment.

## Key features

- AI repair-brief reader for quotes, invoices, and written service requests
- Clear buyer guardrails: total budget, parts cap, urgency, and preferred visit window
- Transparent simulated technician options with visit fee, warranty, and timing terms
- Buyer-controlled PayPal Orders v2 Sandbox booking deposit and capture
- Decision Receipt plus a clearly labelled no-payment demo receipt
- Technician profile registration and operations workspace

## Run locally

```powershell
cd path\to\KaamPakka
python -m pip install -r requirements.txt
python -u app.py
```

Open `http://localhost:5000/` and keep the terminal open while testing.

## Environment variables

Copy `.env.example` to `.env` and configure only the services you use.

```env
SECRET_KEY=replace-with-a-long-random-string
GOOGLE_API_KEY=your-gemini-key
PAYPAL_ENV=sandbox
PAYPAL_CLIENT_ID=your-paypal-sandbox-client-id
PAYPAL_CLIENT_SECRET=your-paypal-sandbox-client-secret
PAYPAL_CURRENCY=INR
```

Without Gemini, the co-pilot uses safe fallback replies. Without PayPal credentials, the decision desk remains usable but displays a Sandbox setup prompt instead of checkout.

## PayPal Sandbox test

1. Create a PayPal Developer account and Sandbox Business/Personal test accounts.
2. Add the REST app client ID and secret to `.env`.
3. Restart the app, create a repair request, choose a technician option, and approve the booking deposit with the Sandbox Personal account.
4. Open the Decision Receipt after capture.

## Prototype boundaries

- Technician options are demo data, not live availability, service promises, or seller onboarding.
- Payments are captured by the configured PayPal Sandbox business account.
- Production multi-merchant payout flows require PayPal platform/partner approval.
- AI does not diagnose the fault, select a technician, approve additional work, or spend money for the buyer.

See [DEVPOST_SUBMISSION.md](DEVPOST_SUBMISSION.md) for the planned demo narrative.
