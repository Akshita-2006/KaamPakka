# KaamPakka — AI-guided local commerce

## Inspiration

Buying from local merchants often means switching between chats, listings, delivery promises, and payment links. KaamPakka creates one deliberate decision moment before money moves.

## What it does

KaamPakka turns a purchase brief, shopping list, or merchant quote into a reviewable route. Its AI co-pilot explains the trade-offs a buyer should check; the decision desk compares demo merchant offers on price and fulfilment speed; and the buyer explicitly selects an offer before PayPal Sandbox checkout starts. A merchant workspace demonstrates the other side of the flow: profile registration, offer operations, AG Grid review, and payment-event visibility.

## PayPal + AI

- **PayPal Orders v2:** server-side access token, order creation, buyer approval, and capture in Sandbox.
- **Gemini:** conversational co-pilot for purchase briefs, offer comparison, fulfilment questions, and buyer checks.
- **Human-in-the-loop agentic commerce:** AI researches and explains; it never selects a merchant or spends money on the buyer's behalf.
- **Decision Receipt:** after a completed capture, the buyer receives an auditable record of the selected merchant, amount, and approval event.
- **AG Grid:** merchant offer operations table for filtering, sorting, and inspecting marketplace data.

## Demo flow (under 3 minutes)

1. Start at the KaamPakka landing page and state the problem: local buying is fragmented and opaque.
2. Sign in, open the dashboard, and create a purchase brief by uploading a sample shopping list or merchant quote.
3. Show the purchase route and explain the visible price / delivery trade-offs.
4. Open Merchant workspace, register a demo merchant profile, and show the AG Grid operations view.
5. Return to the route, choose an offer, acknowledge the terms, and complete a PayPal Sandbox checkout.
6. Show the captured payment event and Decision Receipt.

## Important prototype boundaries

- Merchant offers are simulated local-marketplace data for the demo; they are not live inventory or delivery commitments.
- Checkout captures to the configured PayPal Sandbox business account. Real multi-seller payouts need PayPal partner onboarding.
- AI provides decision support only. Buyers must verify final pricing, stock, fulfilment, and return terms with the merchant.
