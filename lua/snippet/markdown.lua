local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("vue", {
		t({ [[```vue]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("ts", {
		t({ [[```typescript]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("js", {
		t({ [[```javascript]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("glsl", {
		t({ [[```glsl]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("sh", {
		t({ [[```sh]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("rs", {
		t({ [[```rust]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("scss", {
		t({ [[```scss]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("mermaid", {
		t({ [[```mermaid]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
}

return M
