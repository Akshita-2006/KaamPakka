# Nivara — Devpost submission kit

## One-line pitch

Nivara is an AI-guided care marketplace that turns a medical bill into a transparent, user-approved care plan and PayPal checkout.

## Project description

People often have to pay for healthcare under pressure, without a clear way to understand a bill, compare lower-cost options, or see what happens before checkout. Nivara creates a decision layer before money moves.

A user uploads a medical bill or prescription. OCR and Gemini-assisted analysis structure the evidence, while confidence guardrails prevent low-confidence items from entering a checkout-ready plan. Nivara presents the reviewed basket alongside transparent merchant offers: each offer shows its price, delivery promise, and trade-off. The user—not the AI—must select an offer and explicitly approve the plan. Only then does Nivara create and capture a PayPal Sandbox order.

Nivara also includes a merchant workspace built with AG Grid. It makes marketplace offer performance, payment events, and fulfilment positioning inspectable rather than hidden behind an opaque ranking algorithm.

This prototype demonstrates a safer version of agentic commerce: AI reduces research effort, but the human retains control over medical suitability, merchant choice, and payment approval.

## What it does

- Reads medical bills and PDFs with OCR.
- Uses Gemini-assisted analysis with a rule-based fallback.
- Filters low-confidence items before they can enter checkout.
- Builds a transparent care plan with reference-price savings.
- Lets users compare demo merchant offers by price and delivery window.
- Creates and captures PayPal Sandbox orders through server-side Orders v2 calls.
- Records payment events and selected merchant in SQLite.
- Provides an AG Grid merchant workspace for operational review.
- Supports English and Hindi in the core product experience.

## Tools used

- **PayPal Developer Platform:** JavaScript SDK and Orders v2 API for secure Sandbox checkout.
- **Google Gemini:** turns OCR text into structured, cautious care evidence and supports the care assistant.
- **Tesseract OCR / PDF extraction:** reads bills and prescriptions.
- **AG Grid Community:** powers the interactive merchant operations table.
- **Flask and SQLite:** application backend and prototype data storage.

## How PayPal is used

The browser never receives the PayPal client secret. Nivara's Flask backend obtains a PayPal access token, creates an order only after user acknowledgement, and captures it after PayPal approval. The app records the order status, capture ID, selected merchant, and care-plan context. The hackathon demo runs in PayPal Sandbox, so it does not process real money.

## Three-minute video outline

**0:00–0:18 — Problem**

“A healthcare bill is not a buying decision. People need a clear way to understand options before money moves.” Show Nivara landing page.

**0:18–0:48 — AI evidence**

Upload a prepared sample bill. Show OCR review and the resulting evidence page. Explain that low-confidence items are excluded from checkout.

**0:48–1:30 — Agentic decision, with user control**

Open the care plan. Compare merchant offers, point out price and delivery trade-offs, tick the acknowledgement. Say: “The agent prepares; the user chooses and approves.”

**1:30–2:10 — PayPal proof**

Click the PayPal Sandbox button, approve using a Sandbox buyer, and return to the recorded payment event. Explain that create and capture run server-side.

**2:10–2:38 — Merchant workspace**

Open Merchant workspace. Sort or filter the AG Grid table. Explain that the marketplace reasoning is visible to merchants and users rather than hidden.

**2:38–3:00 — Impact and close**

“Nivara makes care commerce calmer: AI explains the choice, PayPal handles the approved payment, and people stay in control.”

## Demo safeguards to say aloud

- The merchant offers are clearly labelled demo offers.
- The payment runs against a configured PayPal Sandbox business account.
- Nivara does not provide medical advice or automatically purchase medication.
- Users must verify availability and clinical suitability with a qualified provider.

## Repository checklist

- [x] Clear setup and PayPal Sandbox instructions in README
- [x] Functional prototype routes and error checks
- [x] Explicit demo merchant and safety disclosures
- [x] Video script under three minutes
- [ ] Add an open-source license file before making the repository public
- [ ] Add hosted demo URL to Devpost after deployment
- [ ] Record and upload the public YouTube demo video
