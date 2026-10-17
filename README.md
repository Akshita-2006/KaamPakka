# KaamPakka

KaamPakka is an AI-guided local-commerce decision desk. It turns a purchase brief, shopping list, or merchant quote into transparent offer trade-offs, then starts a buyer-approved PayPal checkout.

Built for the PayPal AI Hackathon.

## Why it exists

Local shopping is often fragmented: buyers compare screenshots, chat messages, delivery promises, and payment links with little context. KaamPakka gives buyers one clear route before money moves. The AI co-pilot helps with research and comparison; the buyer chooses the merchant and approves every payment.

## Key features

- Purchase-brief reader for lists, quotes, and itemised requests
- Gemini purchase co-pilot for offer, delivery, and checkout questions
- Transparent simulated merchant offers with price / speed trade-offs
- Buyer-controlled PayPal Orders v2 Sandbox checkout and capture
- Decision Receipt for completed payment events
- Merchant profile registration and AG Grid operations workspace

## Run locally

```powershell
cd "C:\Users\AKSHITA SACHDEVA\Desktop\PAYPAL\KaamPakka"
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
3. Restart the app, create a purchase route, choose an offer, and approve the checkout with the Sandbox Personal account.
4. Open the Decision Receipt after capture.

## Prototype boundaries

- Merchant offers are demo data, not live inventory, delivery promises, or seller onboarding.
- Payments are captured by the configured PayPal Sandbox business account.
- Production multi-merchant payout flows require PayPal platform/partner approval.
- AI does not spend money or select an offer for the buyer.

See [DEVPOST_SUBMISSION.md](DEVPOST_SUBMISSION.md) for the planned demo narrative.
