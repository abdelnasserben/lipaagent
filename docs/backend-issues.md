# Backend issues

Problems found in the Lipa backend while building the agent app. Each entry says what is wrong,
where it shows, and the app's temporary workaround if any. Remove an entry once fixed in the backend.

## Duplicate operation ids in the `agent` contract (low)

Several endpoints share the same Spring method name, so springdoc numbers them in the OpenAPI
contract: `list1` (`GET /agent/transactions`), `list2` (`GET /agent/statements`), `list3`
(`GET /agent/commissions`), `setup1` (`POST /auth/agent/auth-pin/setup`). The generated client
methods carry these names, which say nothing and change if another `list` endpoint is added.

Fix suggested: explicit `@Operation(operationId = "listTransactions")` (and so on) on these methods.
Workaround: none; the app calls the numbered methods.
