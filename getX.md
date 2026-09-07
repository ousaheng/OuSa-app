# MASTER PROMPT — BUILD A PRODUCTION E-COMMERCE APP

Act as my **Senior Flutter Architect, Clean Architecture Expert, Supabase Backend Engineer, PostgreSQL Database Designer, GetX State Management Expert, UI/UX Engineer, Security Engineer, and Code Reviewer**.

I want to build a **complete production-style E-Commerce mobile application using Flutter + GetX + Supabase**.

Do NOT create a simple tutorial project.

Build this as a **professional, scalable, maintainable real-world application** that could eventually be used as the foundation for a commercial mobile application.

---

# 🎯 PROJECT GOAL

Build a complete E-Commerce application using:

## Frontend

* Flutter
* Dart
* Material 3
* Responsive UI
* GetX
* Clean Architecture
* Repository Pattern
* Dependency Injection
* Feature-based architecture

## Backend

* Supabase
* PostgreSQL
* Supabase Authentication
* Supabase Storage
* Supabase Realtime
* Supabase Edge Functions when appropriate

## Development

* VS Code
* Git
* GitHub
* Supabase CLI
* Database migrations

---

# 🧱 CORE ARCHITECTURE

Use **Clean Architecture**.

The application should follow:

```text id="7a3n1d"
Presentation
      ↓
GetX Controller
      ↓
Use Case
      ↓
Repository Interface
      ↓
Repository Implementation
      ↓
Data Source
      ↓
Supabase
      ↓
PostgreSQL
```

More specifically:

```text id="1z4y0p"
Flutter UI
     ↓
GetX Controller
     ↓
Use Case
     ↓
Repository
     ↓
Supabase Data Source
     ↓
Supabase
     ↓
PostgreSQL
```

For dependency injection:

```text id="3xq9me"
GetX Bindings
      ↓
Dependencies
      ↓
Controller
      ↓
Use Case
      ↓
Repository
      ↓
Data Source
```

---

# 🚨 IMPORTANT ARCHITECTURE RULE

Do NOT put Supabase queries directly inside:

* Widgets
* Pages
* GetX Controllers

Do NOT put database/business logic directly inside UI.

GetX Controllers should manage **presentation state and user interactions**.

The architecture should remain:

```text id="d2u7kc"
UI
 ↓
Controller
 ↓
Use Case
 ↓
Repository
 ↓
Data Source
 ↓
Supabase
```

---

# 📁 PROJECT STRUCTURE

Use a feature-based Clean Architecture structure.

```text id="f8k2qm"
lib/
│
├── app/
│   ├── app.dart
│   ├── bindings/
│   │   └── initial_binding.dart
│   └── routes/
│       ├── app_pages.dart
│       └── app_routes.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── helpers/
│   ├── services/
│   ├── utils/
│   ├── validators/
│   └── theme/
│
├── config/
│   ├── environment/
│   └── supabase/
│
├── features/
│
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   │
│   │   └── presentation/
│   │       ├── bindings/
│   │       ├── controllers/
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── home/
│   ├── products/
│   ├── categories/
│   ├── brands/
│   ├── favorites/
│   ├── cart/
│   ├── checkout/
│   ├── orders/
│   ├── profile/
│   ├── notifications/
│   └── admin/
│
└── main.dart
```

Explain every folder before using it.

Do not create unnecessary files.

---

# 🧠 GETX RESPONSIBILITIES

Use GetX for:

* State management
* Reactive state
* Dependency injection
* Bindings
* Navigation
* Route middleware
* Snackbars
* Dialogs
* Bottom sheets

Use:

```dart id="q1x7kf"
Obx()
```

for reactive UI where appropriate.

Use:

```dart id="9c2vkd"
GetBuilder<T>()
```

when simple/manual controller updates are more appropriate.

Use:

```dart id="a8n3xp"
Get.find<T>()
```

for dependency retrieval where appropriate.

Use:

```dart id="2m9r8a"
Get.put()
Get.lazyPut()
Get.putAsync()
```

appropriately.

Do NOT blindly use `Obx()` everywhere.

Explain the difference between:

```text id="8z7w0h"
Obx
GetBuilder
GetX<T>
Get.find
Get.put
Get.lazyPut
Bindings
```

---

# 🔄 GETX DATA FLOW

For example, when a user adds a product to the cart:

```text id="4k7h9c"
User
 ↓
Product Details Page
 ↓
CartController
 ↓
AddToCartUseCase
 ↓
CartRepository
 ↓
CartDataSource
 ↓
Supabase
 ↓
PostgreSQL
```

Then:

```text id="m6z0qp"
Supabase response
 ↓
Repository
 ↓
Use Case
 ↓
CartController
 ↓
Rx state
 ↓
Obx()
 ↓
UI
```

Explain this flow for every major feature.

---

# 📦 REQUIRED FEATURES

Build the following modules.

---

# 1. SPLASH SCREEN

Implement:

* App initialization
* Supabase initialization
* Session checking
* Loading state
* Authentication state
* Navigation

Flow:

```text id="0q5k7s"
Splash
 ↓
Initialize
 ↓
Check Supabase Session
 ↓
Authenticated?
 ├── Yes → Home
 └── No  → Welcome/Login
```

---

# 2. ONBOARDING

Create:

* Splash
* Onboarding
* Welcome
* Login
* Register

Use responsive UI.

Create reusable components.

---

# 3. AUTHENTICATION

Implement:

### Register

* Full name
* Email
* Password
* Confirm password

### Login

* Email
* Password

### Other

* Logout
* Forgot password
* Reset password
* Email verification
* Session persistence
* Authentication state

Use Supabase Auth.

---

# 4. AUTH CONTROLLER

Create:

```text id="y8v2nq"
AuthController
```

Responsibilities:

* Login
* Register
* Logout
* Loading state
* Error state
* Current user
* Session state

Example reactive state:

```dart id="h4v8s2"
final isLoading = false.obs;
final currentUser = Rxn<User>();
final errorMessage = ''.obs;
```

But do not place Supabase implementation directly inside the controller.

Architecture:

```text id="e7d1vp"
AuthController
 ↓
LoginUseCase
 ↓
AuthRepository
 ↓
AuthDataSource
 ↓
Supabase Auth
```

---

# 5. USER PROFILE

Create:

```text id="2h7c9p"
Profile
```

Fields:

```text id="8t4k2a"
id
full_name
email
phone
avatar_url
created_at
updated_at
```

Features:

* View profile
* Edit profile
* Upload avatar
* Update name
* Update phone
* Change password
* Logout

---

# OOAD Document
## E-Commerce Mobile App (Flutter + GetX + Clean Architecture + Supabase + PostgreSQL)

**Contents**
- 5. Class Diagram (Domain Model)
- 6. Database Design (PostgreSQL Schema)

---
---

# 5. Class Diagram (Domain Model)

## 5.1 Scope & Approach

This is the **domain model** view of OOAD — the business entities, their attributes, their behavior, and the relationships between them, independent of Flutter/GetX/Supabase implementation details.

A note on layering, since this is a Clean Architecture project: these classes map to your **domain entities** (`lib/features/*/domain/entities/`). They are plain Dart objects with no Supabase/GetX imports. The *data layer* later wraps them in models (`ProductModel extends Product` with `fromJson`/`toJson`), and the *presentation layer* exposes them through GetX controllers — neither of those concerns appears in a domain class diagram.

Notation used below:
- `+` public, `-` private, `+method()` behavior
- Relationship arrows: `──►` association, `◇──►` aggregation (holds, can exist independently), `◆──►` composition (owns, dies with parent), `▷──►` inheritance
- Multiplicity shown as `1`, `0..1`, `1..*`, `0..*` at each end

---

## 5.2 Class-by-Class Definition

### `User` (auth identity — thin wrapper, not app-owned)
```
User
─────────────────────
+ id: String (UUID)
+ email: String
─────────────────────
```
Represents Supabase's `auth.users`. The app never creates/edits this directly — it exists to be the anchor every other class associates back to. Kept minimal deliberately: authentication concerns (password, tokens, sessions) live in the Supabase Auth SDK, not in your domain model.

### `Profile`
```
Profile
─────────────────────
+ id: String (UUID)          // same as User.id
+ fullName: String?
+ phone: String?
+ avatarUrl: String?
+ role: UserRole              // enum: customer, admin
+ createdAt: DateTime
─────────────────────
+ isAdmin(): bool
+ displayName(): String       // fullName ?? "Guest"
```
The app-facing extension of `User`. `isAdmin()` centralizes the role check so it isn't re-implemented ad hoc across controllers.

### `Category`
```
Category
─────────────────────
+ id: String (UUID)
+ name: String
+ slug: String
+ description: String?
+ imageUrl: String?
+ parentId: String?
+ isActive: bool
─────────────────────
+ isSubcategory(): bool       // parentId != null
```

### `Brand`
```
Brand
─────────────────────
+ id: String (UUID)
+ name: String
+ slug: String
+ logoUrl: String?
+ isActive: bool
─────────────────────
```

### `Product`
```
Product
─────────────────────
+ id: String (UUID)
+ categoryId: String?
+ brandId: String?
+ name: String
+ slug: String
+ description: String?
+ price: double
+ compareAtPrice: double?
+ stockQuantity: int
+ sku: String?
+ isActive: bool
+ ratingAvg: double
+ ratingCount: int
+ images: List<ProductImage>
─────────────────────
+ isInStock(): bool           // stockQuantity > 0
+ hasDiscount(): bool         // compareAtPrice != null && compareAtPrice > price
+ discountPercent(): double
+ primaryImage(): ProductImage?
```
The richest class in the model — most business rules that read as "is this product buyable / on sale / displayable" live here rather than being recomputed in the UI layer.

### `ProductImage`
```
ProductImage
─────────────────────
+ id: String (UUID)
+ productId: String
+ imageUrl: String
+ displayOrder: int
+ isPrimary: bool
─────────────────────
```

### `Favorite`
```
Favorite
─────────────────────
+ id: String (UUID)
+ userId: String
+ productId: String
+ createdAt: DateTime
─────────────────────
```
A join entity, but modeled as its own class (not just a foreign-key pair) because it carries `createdAt` and is independently created/deleted through explicit "toggle favorite" behavior.

### `CartItem`
```
CartItem
─────────────────────
+ id: String (UUID)
+ userId: String
+ product: Product
+ quantity: int
─────────────────────
+ lineTotal(): double         // product.price * quantity
```
Note: `CartItem` holds a full `Product` reference (aggregation), not just a `productId` string — the Cart UI needs the product's name/image/price/stock to render and validate, and re-fetching it separately on every cart read would be wasteful.

### `Cart` (aggregate root — not a DB table, a domain concept)
```
Cart
─────────────────────
+ userId: String
+ items: List<CartItem>
─────────────────────
+ addItem(product, qty): void
+ removeItem(productId): void
+ updateQuantity(productId, qty): void
+ subtotal(): double          // sum of lineTotal()
+ itemCount(): int
```
`Cart` doesn't correspond to a table — it's a domain aggregate that composes `CartItem`s and centralizes the business rules (stock check before adding, quantity clamping) so they exist in exactly one place rather than being duplicated across the GetX controller.

### `Address`
```
Address
─────────────────────
+ id: String (UUID)
+ userId: String
+ label: String
+ recipientName: String
+ phone: String
+ addressLine1: String
+ addressLine2: String?
+ city: String
+ stateProvince: String?
+ postalCode: String?
+ country: String
+ isDefault: bool
─────────────────────
+ fullAddress(): String       // formatted single-line/multi-line output
```

### `Order`
```
Order
─────────────────────
+ id: String (UUID)
+ userId: String
+ address: Address?
+ orderNumber: String
+ status: OrderStatus          // enum: pending, confirmed, processing, shipped, delivered, cancelled
+ items: List<OrderItem>
+ subtotal: double
+ shippingFee: double
+ total: double
+ paymentMethod: PaymentMethod // enum: cod, card, wallet
+ paymentStatus: PaymentStatus // enum: unpaid, paid, refunded
+ notes: String?
+ createdAt: DateTime
─────────────────────
+ canCancel(): bool            // status in {pending, confirmed}
+ isCompleted(): bool          // status == delivered
```
Business rule ownership example: "can this order still be cancelled" is a domain question, answered by `canCancel()` on the entity — not scattered as an `if` check in the presentation layer.

### `OrderItem`
```
OrderItem
─────────────────────
+ id: String (UUID)
+ orderId: String
+ productId: String?
+ productName: String          // snapshot
+ productImage: String?        // snapshot
+ unitPrice: double            // snapshot
+ quantity: int
+ lineTotal: double
─────────────────────
```
Deliberately **not** holding a live `Product` reference (unlike `CartItem`) — it holds snapshotted scalar fields, matching the DB design's historical-accuracy rule.

### `Notification`
```
Notification
─────────────────────
+ id: String (UUID)
+ userId: String
+ title: String
+ body: String
+ type: NotificationType       // enum: order, promotion, system, general
+ referenceId: String?
+ isRead: bool
+ createdAt: DateTime
─────────────────────
+ markAsRead(): void
```

### `Review`
```
Review
─────────────────────
+ id: String (UUID)
+ productId: String
+ userId: String
+ orderItemId: String?
+ rating: int                  // 1..5
+ comment: String?
+ createdAt: DateTime
─────────────────────
+ isVerifiedPurchase(): bool   // orderItemId != null
```

---

## 5.3 Enumerations

```
UserRole          { customer, admin }
OrderStatus       { pending, confirmed, processing, shipped, delivered, cancelled }
PaymentMethod     { cod, card, wallet }
PaymentStatus     { unpaid, paid, refunded }
NotificationType  { order, promotion, system, general }
```
Modeling these as enums (not free-text) in the domain layer means the Postgres `check` constraints from the database design (Section 6) and the domain model agree on the same closed set of values — one is the source of truth, the other mirrors it in Dart's type system.

---

## 5.4 Relationships & Multiplicities

| From | To | Multiplicity | Kind | Why |
|---|---|---|---|---|
| `User` | `Profile` | 1 — 1 | association | identity extension |
| `Category` | `Category` | 0..1 — 0..* | association (self) | parent/subcategory |
| `Category` | `Product` | 1 — 0..* | association | classification |
| `Brand` | `Product` | 1 — 0..* | association | classification |
| `Product` | `ProductImage` | 1 — 0..* | **composition** | images have no meaning without the product |
| `User` | `Favorite` | 1 — 0..* | composition | favorite dies with user |
| `Favorite` | `Product` | 0..* — 1 | association | |
| `Cart` | `CartItem` | 1 — 0..* | composition | cart owns its line items |
| `CartItem` | `Product` | 1 — 1 | **aggregation** | cart item references, doesn't own, the product |
| `User` | `Address` | 1 — 0..* | composition | |
| `User` | `Order` | 1 — 0..* | association (restrict) | order outlives normal deletion rules |
| `Address` | `Order` | 0..1 — 0..* | association | |
| `Order` | `OrderItem` | 1 — 1..* | **composition** | line items die with the order |
| `Product` | `OrderItem` | 0..1 — 0..* | association (optional) | snapshot survives product deletion |
| `User` | `Notification` | 1 — 0..* | composition | |
| `Product` | `Review` | 1 — 0..* | association | |
| `User` | `Review` | 1 — 0..* | association | |
| `OrderItem` | `Review` | 0..1 — 0..1 | association (optional) | verified-purchase link |

The **composition vs aggregation** distinction is the one thing worth double-checking as you implement: composition (`◆`) means the child has no independent lifecycle (delete the parent, the child is gone — matches your `on delete cascade` choices in the DB). Aggregation (`◇`) means the referenced object is shared/borrowed, not owned — `CartItem` holding a `Product` is exactly this: deleting a cart item must never delete the product.

---

## 5.5 Conceptual Class Diagram

```
                              ┌────────────┐
                              │    User    │
                              └─────┬──────┘
                    1:1             │
              ┌───────────────┬─────┼────────────┬──────────────┬──────────────┐
              │               │     │            │              │              │
        ┌─────▼─────┐  ┌──────▼───┐ │      ┌──────▼─────┐ ┌──────▼─────┐ ┌──────▼───────┐
        │  Profile  │  │ Address  │ │      │    Cart    │ │   Order    │ │Notification  │
        └───────────┘  └────┬─────┘ │      └─────┬──────┘ └─────┬──────┘ └──────────────┘
                             │       │      1◆──►0..*     1◆──►1..*
                             │       │            │              │
                             │  ┌────▼─────┐ ┌─────▼──────┐┌──────▼──────┐
                             │  │ Favorite │ │  CartItem  ││ OrderItem   │
                             │  └────┬─────┘ └─────┬──────┘└──────┬──────┘
                             │       │             │◇             │ (snapshot,
                        many:1│      │many:1       │ (aggregation) │  optional FK)
                             │       │             │              │
                             │  ┌────▼─────────────▼──────────────▼───┐
                             └──►               Product                │
                                └───┬────────────────────┬────────────┘
                                    │1◆──►0..*            │many:1  many:1
                              ┌─────▼──────┐        ┌─────▼─────┐ ┌────────┐
                              │ProductImage│        │ Category  │ │ Brand  │
                              └────────────┘        └─────┬─────┘ └────────┘
                                                           │0..1 self-ref
                                                     ┌─────▼─────┐
                                                     │ Category  │ (parent)
                                                     └───────────┘

        Product ◄──many:1── Review ──many:1──► User
                                │0..1
                          OrderItem (verified-purchase link)
```

**Reading it:** `User` is the aggregate anchor (same as the ERD's hub in Section 6). `Product` is the second hub, shared across `CartItem`, `Favorite`, `OrderItem`, and `Review` — but note it's **owned** (composition) only by `ProductImage`; everywhere else it's referenced (association/aggregation), which is the correct domain reading of "products live and die independently of carts, favorites, or orders referencing them."

---

## 5.6 Class Diagram vs. Database Design — Where They Diverge

Worth flagging explicitly, since you'll compare this against the Section 6 schema:

- **`Cart` has no table.** It's a pure domain aggregate over `cart_items` rows — introduced here to hold cart-level behavior (`subtotal()`, `addItem()`) rather than leaving that logic to sit in a GetX controller.
- **Enums here are richer than Postgres `check` constraints** — the DB enforces the same closed set of values, but only Dart gets actual enum types with exhaustive `switch` support.
- **`CartItem.product` is a full object, not an ID** — the DB row only stores `product_id`; the *repository* is what does the join/hydration to build this richer domain object before handing it to the presentation layer.
- **No `updated_at`/audit trigger classes** — those are infrastructure concerns (Section 6.6), not domain behavior, so they don't appear in a domain model.

---
---

# 6. Database Design (PostgreSQL Schema)

## 6.1 Design Principles

Before the tables, the ground rules this schema follows:

- **`auth.users` is the identity root.** Supabase's built-in `auth.users` table handles authentication (email, password hash, sessions). We never duplicate auth data — `profiles` extends it 1:1 via a shared primary key.
- **UUIDs everywhere.** Every primary key is `uuid` (via `gen_random_uuid()`), not a serial integer. This matches Supabase convention, avoids ID-guessing/enumeration attacks, and lets client apps generate IDs offline if ever needed.
- **`ON DELETE` behavior is deliberate, not default.** Cascade where a child row has no meaning without its parent (e.g. `product_images`), restrict/set-null where the parent's history must survive the child's deletion (e.g. an order shouldn't vanish if a product is deleted).
- **Money is `numeric`, never `float`.** Floating point rounding errors are unacceptable for prices/totals.
- **Timestamps are `timestamptz`**, not `timestamp`, so time zones are never ambiguous.
- **Row Level Security (RLS) is enabled on every table.** Ownership is enforced by Postgres itself, not just app-layer logic — consistent with what you already have in Phases 12–15 (Favorites/Cart/Addresses/Orders).
- **Snapshotting over referencing for orders.** `order_items` stores the product name/price *at time of purchase*, not a live join to `products`. Prices change; historical orders must not.

---

## 6.2 Full Schema (DDL)

```sql
-- ============================================================
-- EXTENSIONS
-- ============================================================
create extension if not exists "pgcrypto";   -- gen_random_uuid()
create extension if not exists "pg_trgm";    -- fuzzy/ILIKE search (Phase 11)

-- ============================================================
-- 1. PROFILES
-- ============================================================
create table public.profiles (
  id            uuid primary key references auth.users(id) on delete cascade,
  full_name     text,
  phone         text,
  avatar_url    text,
  role          text not null default 'customer'
                  check (role in ('customer', 'admin')),
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index idx_profiles_role on public.profiles(role);

-- ============================================================
-- 2. CATEGORIES
-- ============================================================
create table public.categories (
  id            uuid primary key default gen_random_uuid(),
  name          text not null,
  slug          text not null unique,
  description   text,
  image_url     text,
  parent_id     uuid references public.categories(id) on delete set null,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index idx_categories_parent_id on public.categories(parent_id);
create index idx_categories_slug on public.categories(slug);

-- ============================================================
-- 3. BRANDS
-- ============================================================
create table public.brands (
  id            uuid primary key default gen_random_uuid(),
  name          text not null unique,
  slug          text not null unique,
  logo_url      text,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now()
);

create index idx_brands_slug on public.brands(slug);

-- ============================================================
-- 4. PRODUCTS
-- ============================================================
create table public.products (
  id              uuid primary key default gen_random_uuid(),
  category_id     uuid references public.categories(id) on delete set null,
  brand_id        uuid references public.brands(id) on delete set null,
  name            text not null,
  slug            text not null unique,
  description     text,
  price           numeric(12,2) not null check (price >= 0),
  compare_at_price numeric(12,2) check (compare_at_price >= 0),
  stock_quantity  integer not null default 0 check (stock_quantity >= 0),
  sku             text unique,
  is_active       boolean not null default true,
  rating_avg      numeric(2,1) not null default 0 check (rating_avg between 0 and 5),
  rating_count    integer not null default 0 check (rating_count >= 0),
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index idx_products_category_id on public.products(category_id);
create index idx_products_brand_id on public.products(brand_id);
create index idx_products_is_active on public.products(is_active);
create index idx_products_name_trgm on public.products using gin (name gin_trgm_ops);

-- ============================================================
-- 5. PRODUCT_IMAGES
-- ============================================================
create table public.product_images (
  id            uuid primary key default gen_random_uuid(),
  product_id    uuid not null references public.products(id) on delete cascade,
  image_url     text not null,
  display_order integer not null default 0,
  is_primary    boolean not null default false,
  created_at    timestamptz not null default now()
);

create index idx_product_images_product_id on public.product_images(product_id);

-- Only one primary image per product
create unique index uq_one_primary_image_per_product
  on public.product_images(product_id)
  where is_primary = true;

-- ============================================================
-- 6. FAVORITES
-- ============================================================
create table public.favorites (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users(id) on delete cascade,
  product_id    uuid not null references public.products(id) on delete cascade,
  created_at    timestamptz not null default now(),
  unique (user_id, product_id)
);

create index idx_favorites_user_id on public.favorites(user_id);

-- ============================================================
-- 7. CART_ITEMS
-- ============================================================
create table public.cart_items (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users(id) on delete cascade,
  product_id    uuid not null references public.products(id) on delete cascade,
  quantity      integer not null default 1 check (quantity > 0),
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (user_id, product_id)
);

create index idx_cart_items_user_id on public.cart_items(user_id);

-- ============================================================
-- 8. ADDRESSES
-- ============================================================
create table public.addresses (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references auth.users(id) on delete cascade,
  label           text not null default 'Home',
  recipient_name  text not null,
  phone           text not null,
  address_line1   text not null,
  address_line2   text,
  city            text not null,
  state_province  text,
  postal_code     text,
  country         text not null default 'Cambodia',
  is_default      boolean not null default false,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index idx_addresses_user_id on public.addresses(user_id);

-- Only one default address per user
create unique index uq_one_default_address_per_user
  on public.addresses(user_id)
  where is_default = true;

-- ============================================================
-- 9. ORDERS
-- ============================================================
create table public.orders (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references auth.users(id) on delete restrict,
  address_id      uuid references public.addresses(id) on delete set null,
  order_number    text not null unique,
  status          text not null default 'pending'
                    check (status in
                      ('pending','confirmed','processing','shipped','delivered','cancelled')),
  subtotal        numeric(12,2) not null check (subtotal >= 0),
  shipping_fee    numeric(12,2) not null default 0 check (shipping_fee >= 0),
  total           numeric(12,2) not null check (total >= 0),
  payment_method  text not null default 'cod'
                    check (payment_method in ('cod','card','wallet')),
  payment_status  text not null default 'unpaid'
                    check (payment_status in ('unpaid','paid','refunded')),
  notes           text,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index idx_orders_user_id on public.orders(user_id);
create index idx_orders_status on public.orders(status);
create index idx_orders_created_at on public.orders(created_at desc);

-- ============================================================
-- 10. ORDER_ITEMS
-- ============================================================
create table public.order_items (
  id              uuid primary key default gen_random_uuid(),
  order_id        uuid not null references public.orders(id) on delete cascade,
  product_id      uuid references public.products(id) on delete set null,
  product_name    text not null,        -- snapshot, survives product edits/deletion
  product_image   text,                 -- snapshot
  unit_price      numeric(12,2) not null check (unit_price >= 0),
  quantity        integer not null check (quantity > 0),
  line_total      numeric(12,2) not null check (line_total >= 0),
  created_at      timestamptz not null default now()
);

create index idx_order_items_order_id on public.order_items(order_id);
create index idx_order_items_product_id on public.order_items(product_id);

-- ============================================================
-- 11. NOTIFICATIONS
-- ============================================================
create table public.notifications (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users(id) on delete cascade,
  title         text not null,
  body          text not null,
  type          text not null default 'general'
                  check (type in ('order', 'promotion', 'system', 'general')),
  reference_id  uuid,          -- e.g. order_id, nullable, not FK-constrained (polymorphic)
  is_read       boolean not null default false,
  created_at    timestamptz not null default now()
);

create index idx_notifications_user_id on public.notifications(user_id);
create index idx_notifications_user_unread
  on public.notifications(user_id) where is_read = false;

-- ============================================================
-- 12. REVIEWS
-- ============================================================
create table public.reviews (
  id            uuid primary key default gen_random_uuid(),
  product_id    uuid not null references public.products(id) on delete cascade,
  user_id       uuid not null references auth.users(id) on delete cascade,
  order_item_id uuid references public.order_items(id) on delete set null,
  rating        integer not null check (rating between 1 and 5),
  comment       text,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (user_id, product_id)   -- one review per user per product
);

create index idx_reviews_product_id on public.reviews(product_id);
create index idx_reviews_user_id on public.reviews(user_id);
```

---

## 6.3 Table-by-Table Explanation

### 1. `profiles`
**Purpose:** Extends Supabase's `auth.users` with app-specific, non-auth data. Kept separate from `auth.users` because that table is Supabase-managed — we never add arbitrary columns to it directly.

| Column | Type | Notes |
|---|---|---|
| `id` | uuid, PK | Same value as `auth.users.id` — this is a **shared primary key**, not a separate identity. |
| `full_name` | text | Nullable — user may not fill it in immediately after signup. |
| `phone` | text | Nullable. |
| `avatar_url` | text | Path/URL into Supabase Storage (Phase 8). |
| `role` | text | Constrained to `customer` / `admin`. Drives RLS policies and UI (admin dashboard vs customer app). |
| `created_at`, `updated_at` | timestamptz | Standard audit columns. |

- **PK:** `id` (also FK to `auth.users.id`, `on delete cascade` — deleting the auth user deletes the profile).
- **Relationship:** 1:1 with `auth.users`.
- **Index:** on `role`, since admin-only queries filter by it often.

### 2. `categories`
**Purpose:** Hierarchical product classification (supports subcategories, e.g. "Electronics" → "Phones").

| Column | Notes |
|---|---|
| `slug` | URL-safe unique identifier, used in deep links / SEO-style routes. |
| `parent_id` | Self-referencing FK — `null` means top-level category. |
| `is_active` | Soft-disable a category without deleting its history. |

- **PK:** `id`.
- **FK:** `parent_id → categories.id`, `on delete set null` (deleting a parent doesn't cascade-delete children; they become top-level instead — prevents silent data loss).
- **Relationship:** 1:many self-referencing (parent/child); 1:many to `products`.
- **Indexes:** `parent_id` (tree traversal), `slug` (lookup by URL).

### 3. `brands`
**Purpose:** Manufacturer/brand metadata, independent of category.

- **PK:** `id`. **Unique:** `name`, `slug`.
- **Relationship:** 1:many to `products`.
- **Index:** `slug`.

### 4. `products`
**Purpose:** The core catalog entity.

| Column | Notes |
|---|---|
| `category_id`, `brand_id` | Nullable FKs — a product can exist temporarily uncategorized. `on delete set null` so removing a category doesn't destroy products, only unlinks them. |
| `price` | `numeric(12,2)` — exact decimal, no float rounding errors. |
| `compare_at_price` | Optional "was" price for showing discounts/strikethrough. |
| `stock_quantity` | Drives the Cart stock-check logic from Phase 13. |
| `sku` | Unique warehouse code, nullable (not all sellers assign one immediately). |
| `rating_avg`, `rating_count` | **Denormalized aggregates** from `reviews` — kept here (updated via trigger, see 6.6) so the product list (Phase 9) can sort/filter by rating without joining/aggregating `reviews` on every request. |

- **PK:** `id`. **Unique:** `slug`, `sku`.
- **FKs:** `category_id`, `brand_id` (both `set null`).
- **Relationship:** 1:many to `product_images`, `favorites`, `cart_items`, `order_items`, `reviews`.
- **Indexes:** `category_id`, `brand_id`, `is_active` (product list filters), and a **GIN trigram index** on `name` — this is what powers the `ilike`-based fuzzy search from Phase 11 without a full table scan.

### 5. `product_images`
**Purpose:** One-to-many gallery images per product (a product has multiple photos).

| Column | Notes |
|---|---|
| `display_order` | Controls carousel ordering. |
| `is_primary` | Marks the thumbnail/cover image. |

- **PK:** `id`. **FK:** `product_id → products.id`, `on delete cascade` (images are meaningless without their product).
- **Constraint:** partial unique index ensures **only one** `is_primary = true` row per product — enforced by the database, not just app logic.
- **Index:** `product_id`.

### 6. `favorites`
**Purpose:** Wishlist join table (Phase 12).

- **PK:** `id`. **FKs:** `user_id → auth.users`, `product_id → products`, both `cascade`.
- **Constraint:** `unique(user_id, product_id)` — prevents duplicate favoriting; the app's "toggle" logic relies on this.
- **Relationship:** many:many between users and products, materialized as this join table.
- **Index:** `user_id` (fetching "my favorites").

### 7. `cart_items`
**Purpose:** Persistent shopping cart per user (Phase 13).

| Column | Notes |
|---|---|
| `quantity` | `check (quantity > 0)` — zero-quantity rows don't exist; removing an item deletes the row instead. |

- **PK:** `id`. **FKs:** cascade on both `user_id` and `product_id`.
- **Constraint:** `unique(user_id, product_id)` — this is what makes "add to cart" an **upsert** (increment quantity) rather than a duplicate row, matching your Phase 13 implementation.
- **Index:** `user_id`.

### 8. `addresses`
**Purpose:** Shipping addresses per user (Phase 14).

- **PK:** `id`. **FK:** `user_id`, cascade.
- **Constraint:** partial unique index on `(user_id) where is_default = true` — mirrors the `product_images` primary-image pattern: only one default address per user, enforced at the DB level (backs the "set-default" trigger you mentioned from Phase 6/14).
- **Index:** `user_id`.

### 9. `orders`
**Purpose:** Order header — one row per checkout (Phase 15).

| Column | Notes |
|---|---|
| `user_id` | `on delete restrict` — deliberately **not** cascade. A user account should not be deletable while it has order history (financial/legal record-keeping); the app must handle user deletion separately (e.g. anonymize, don't cascade-delete orders). |
| `address_id` | `on delete set null` — if an address is later deleted, the order keeps existing but loses the FK link (in practice you'd also snapshot the address text here for full historical accuracy — see 6.7 note). |
| `order_number` | Human-readable unique reference (e.g. `ORD-20260905-0001`), separate from the internal UUID, shown to the customer. |
| `status` | Finite state machine, enforced by `check`. |
| `payment_method`, `payment_status` | Separate concerns: *how* they paid vs *whether* it's settled. |

- **PK:** `id`.
- **Relationship:** 1:many to `order_items`; many:1 to `profiles`/`auth.users` and `addresses`.
- **Indexes:** `user_id` (order history), `status` (admin dashboard filtering), `created_at desc` (recent-orders queries).

### 10. `order_items`
**Purpose:** Line items per order — this is the **snapshot table**.

| Column | Notes |
|---|---|
| `product_id` | `on delete set null` — if the product is later deleted, the historical order line survives (that's the whole point of snapshotting). |
| `product_name`, `product_image`, `unit_price` | Copied at order-creation time. Even if the live product's price/name changes tomorrow, this row still shows what the customer actually paid. |
| `line_total` | `unit_price * quantity`, stored (not computed on read) for the same historical-accuracy reason. |

- **PK:** `id`. **FK:** `order_id`, cascade (line items have no meaning without the order).
- **Relationship:** many:1 to `orders`, many:1 (optional) to `products`.
- **Indexes:** `order_id`, `product_id`.

### 11. `notifications`
**Purpose:** In-app notification feed (order updates, promotions, system messages).

| Column | Notes |
|---|---|
| `reference_id` | Deliberately **not** a foreign key — it's polymorphic (could point to an order, a promotion, etc. depending on `type`). Enforcing referential integrity here would require a different pattern (e.g. separate reference tables per type), which is over-engineering for a notification feed. |
| `is_read` | Drives the unread-badge count. |

- **PK:** `id`. **FK:** `user_id`, cascade.
- **Index:** `user_id`; plus a **partial index** `where is_read = false` — this is the query that runs on every app open (unread count/badge), so it's optimized specifically.

### 12. `reviews`
**Purpose:** Product ratings/comments, optionally tied to a verified purchase.

| Column | Notes |
|---|---|
| `order_item_id` | Nullable FK — if present, marks this as a **verified purchase** review. `on delete set null` so deleting the order doesn't delete the review, just its "verified" badge basis. |
| `rating` | `check (rating between 1 and 5)`. |

- **PK:** `id`. **FKs:** `product_id` cascade, `user_id` cascade, `order_item_id` set null.
- **Constraint:** `unique(user_id, product_id)` — one review per user per product (edit, don't duplicate).
- **Relationship:** many:1 to `products`, many:1 to `auth.users`, optional many:1 to `order_items`.
- **Indexes:** `product_id` (show reviews on product page), `user_id` (show "my reviews").

---

## 6.4 Relationship Summary

| Relationship | Type | Enforced by |
|---|---|---|
| `auth.users` ↔ `profiles` | 1 : 1 | shared PK/FK, cascade |
| `categories` ↔ `categories` | 1 : many (self) | `parent_id`, set null |
| `categories` → `products` | 1 : many | `category_id`, set null |
| `brands` → `products` | 1 : many | `brand_id`, set null |
| `products` → `product_images` | 1 : many | `product_id`, cascade |
| `auth.users` ↔ `products` (via `favorites`) | many : many | join table, cascade both sides |
| `auth.users` ↔ `products` (via `cart_items`) | many : many | join table, cascade both sides |
| `auth.users` → `addresses` | 1 : many | `user_id`, cascade |
| `auth.users` → `orders` | 1 : many | `user_id`, restrict |
| `addresses` → `orders` | 1 : many | `address_id`, set null |
| `orders` → `order_items` | 1 : many | `order_id`, cascade |
| `products` → `order_items` | 1 : many (optional) | `product_id`, set null |
| `auth.users` → `notifications` | 1 : many | `user_id`, cascade |
| `products` ↔ `auth.users` (via `reviews`) | many : many | join-like table, cascade both sides |
| `order_items` → `reviews` | 1 : 0..1 | `order_item_id`, set null |

---

## 6.5 Conceptual ERD

```
                         ┌───────────────┐
                         │  auth.users   │  (Supabase-managed)
                         └───────┬───────┘
                                 │ 1:1
                    ┌────────────┼───────────────────────────────┬─────────────┬───────────────┐
                    │            │                               │             │               │
             ┌──────▼─────┐ ┌────▼─────┐                  ┌──────▼─────┐┌──────▼─────┐  ┌───────▼──────┐
             │  profiles  │ │ addresses│                  │ favorites  ││ cart_items │  │notifications │
             └────────────┘ └────┬─────┘                  └──────┬─────┘└──────┬─────┘  └──────────────┘
                                  │ 1:many                        │ M:N          │ M:N
                                  │                                │              │
                            ┌─────▼─────┐                    ┌─────▼──────────────▼─────┐
                            │  orders   │                    │        products           │
                            └─────┬─────┘                    └──┬──────┬──────┬───────┬──┘
                                  │ 1:many                       │      │      │       │
                            ┌─────▼───────┐          many:1─────┘      │      │       │ 1:many
                            │ order_items │◄──────────────────────────┘      │       │
                            └─────┬───────┘   product_id (set null)          │       │
                                  │ 1:0..1                                    │       │
                            ┌─────▼─────┐                              ┌──────▼──┐┌───▼─────────────┐
                            │  reviews  │──────────────────────────────►category_id categories       │
                            └───────────┘   many:1 (set null)          └─────────┘└──────────────────┘
                                                                              (self-referencing parent_id)

             products ──many:1──► brands (brand_id, set null)
             products ──1:many──► product_images (product_id, cascade)
```

**Reading the diagram:**
- `auth.users` is the hub — nearly every user-owned table (`profiles`, `addresses`, `favorites`, `cart_items`, `orders`, `notifications`, `reviews`) hangs off it directly.
- `products` is the second hub — connected to `categories`, `brands`, `product_images`, `favorites`, `cart_items`, `order_items`, and `reviews`.
- `orders` → `order_items` → `reviews` forms the **purchase-to-review chain**: you can only leave a "verified" review by referencing the specific `order_item_id` you bought.
- `categories` self-references for the parent/subcategory tree.

---

## 6.6 Supporting Objects (Triggers)

A few columns above only stay correct with automation, not raw constraints:

```sql
-- Keep updated_at fresh on every UPDATE
create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger trg_products_updated_at
  before update on public.products
  for each row execute function public.set_updated_at();
-- (repeat for profiles, categories, addresses, orders, reviews)

-- Recalculate products.rating_avg / rating_count after review changes
create or replace function public.refresh_product_rating()
returns trigger as $$
begin
  update public.products p
  set rating_avg = coalesce((
        select round(avg(r.rating)::numeric, 1)
        from public.reviews r where r.product_id = coalesce(new.product_id, old.product_id)
      ), 0),
      rating_count = (
        select count(*) from public.reviews r
        where r.product_id = coalesce(new.product_id, old.product_id)
      )
  where p.id = coalesce(new.product_id, old.product_id);
  return null;
end;
$$ language plpgsql;

create trigger trg_reviews_refresh_rating
  after insert or update or delete on public.reviews
  for each row execute function public.refresh_product_rating();
```

---

## 6.7 Notes / Things to Flag for Later Phases

- **RLS policies** are not written here — as agreed in Phase 6, this covers the schema itself only (RLS enabled but policy definitions come per-feature, matching how Phases 12–15 each added their own owner-scoped policies).
- **Address snapshotting:** for full historical accuracy you may eventually want `orders` to also store a flattened `shipping_address` (text/jsonb) snapshot, the same way `order_items` snapshots product data — right now, if a user edits/deletes an address, old orders keep the FK link but not the point-in-time text. Flag this as an enhancement, not a blocker.
- **`reference_id` in `notifications`** is intentionally not a strict FK (polymorphic reference) — documented above so it isn't mistaken for an oversight during review.
---

# 7. PRODUCT SYSTEM

Product fields should include appropriate fields such as:

```text id="k3z8vf"
id
category_id
brand_id
name
description
price
original_price
stock_quantity
rating
review_count
is_active
created_at
updated_at
```

Implement:

* Product list
* Product details
* Product images
* Categories
* Brands
* Search
* Filtering
* Sorting
* Pagination
* Stock handling

---

# 8. PRODUCT CONTROLLER

Create:

```text id="j8q2mp"
ProductController
```

Manage:

```text id="2t9x7c"
products
selectedProduct
isLoading
isLoadingMore
errorMessage
searchQuery
selectedCategory
selectedBrand
sortOption
```

Use reactive state where useful:

```dart id="v4c8nx"
final products = <Product>[].obs;
final isLoading = false.obs;
final isLoadingMore = false.obs;
final searchQuery = ''.obs;
```

Do not make every field reactive without a reason.

---

# 9. CATEGORIES

Implement:

* Category list
* Category details
* Products by category
* Category filtering

Use PostgreSQL relationships.

---

# 10. BRANDS

Implement:

* Brand list
* Brand details
* Products by brand

---

# 11. SEARCH

Implement:

* Product search
* Search loading
* Empty result
* Clear search
* Debouncing
* Search history concept

Use appropriate PostgreSQL queries.

Explain database indexing.

---

# 12. FILTERING

Implement:

* Category
* Brand
* Price range
* Rating
* Stock availability

Allow multiple filters.

---

# 13. SORTING

Implement:

```text id="0p4gkh"
Price Low → High
Price High → Low
Newest
Rating
Popularity
```

---

# 14. PAGINATION

Implement efficient pagination.

Support:

```text id="2b9x0d"
Initial loading
Loading more
No more data
Pagination error
Refresh
```

Use Supabase range queries where appropriate.

---

# 15. FAVORITES

Create:

```text id="8v3jka"
FavoriteController
```

Features:

* Add favorite
* Remove favorite
* Check favorite
* Favorite list
* Persistent database storage

Database:

```text id="z5y7xq"
favorites
```

Secure with RLS.

---

# 16. CART

Create:

```text id="r4w8ks"
CartController
```

Features:

* Add product
* Remove product
* Increase quantity
* Decrease quantity
* Update quantity
* Clear cart
* Calculate subtotal
* Calculate total
* Validate stock

Reactive state:

```dart id="q9v3mc"
final cartItems = <CartItem>[].obs;
final totalPrice = 0.0.obs;
final cartCount = 0.obs;
```

Prefer derived getters/computed state where appropriate instead of unnecessarily storing duplicate state.

---

# 17. CART UI

Create professional cart UI.

Include:

* Product image
* Product name
* Price
* Quantity selector
* Remove button
* Subtotal
* Total
* Checkout button

Handle:

* Empty cart
* Loading
* Error
* Out of stock
* Quantity limits

---

# 18. ADDRESS MANAGEMENT

Create:

```text id="k5z9cw"
AddressController
```

Features:

* Add address
* Edit address
* Delete address
* Set default
* Select address

Database:

```text id="q3m7xn"
addresses
```

---

# 19. CHECKOUT

Flow:

```text id="b7v5q2"
Cart
 ↓
Checkout
 ↓
Select Address
 ↓
Order Summary
 ↓
Payment
 ↓
Confirmation
```

Display:

* Products
* Quantity
* Subtotal
* Delivery fee
* Discount
* Total
* Address
* Payment method

---

# 20. ORDER SYSTEM

Tables:

```text id="n2q8wa"
orders
order_items
```

Implement:

* Create order
* Order history
* Order details
* Cancel order
* Track order

---

# 21. ORDER CONTROLLER

Create:

```text id="c7m1zx"
OrderController
```

Manage:

* Orders
* Selected order
* Loading
* Error
* Order status
* Creating order

---

# 22. ORDER STATUS

Use statuses such as:

```text id="f9q2vn"
pending
confirmed
processing
shipped
delivered
cancelled
```

Explain valid state transitions.

---

# 23. SUPABASE RLS

Enable RLS for all sensitive tables.

Secure:

```text id="a8q7m1"
profiles
favorites
cart_items
addresses
orders
order_items
notifications
reviews
```

Users should only access their own private data.

Products/categories/brands may have public read access when appropriate.

Explain every policy.

---

# 24. SUPABASE STORAGE

Create:

```text id="v7k4q2"
avatars
product-images
```

Implement:

* Upload
* Replace
* Delete
* Retrieve URL
* Secure access

Explain Storage policies.

---

# 25. REALTIME

Use Realtime for appropriate features.

Implement:

```text id="x4m8zc"
Order status
Notifications
```

Flow:

```text id="p8q2nv"
Admin
 ↓
Update order
 ↓
PostgreSQL
 ↓
Supabase Realtime
 ↓
OrderController
 ↓
Rx state
 ↓
Obx()
 ↓
Flutter UI
```

Properly dispose/unsubscribe from channels.

---

# 26. NOTIFICATIONS

Create:

```text id="w3j8ka"
NotificationController
```

Features:

* Notification list
* Read/unread
* Mark as read
* Delete

Use Realtime where appropriate.

---

# 27. REVIEWS

Implement:

* Create review
* Update review
* Delete review
* Rating
* Comment
* Product reviews

Enforce appropriate database constraints.

Consider:

```text id="k8m2vr"
One review per user per purchased product/order
```

---

# 28. ADMIN

Create Admin module.

Admin can:

* Create products
* Update products
* Delete products
* Manage categories
* Manage brands
* View orders
* Update order status
* View users

Regular users must not access admin operations.

---

# 29. ROLE-BASED ACCESS CONTROL

Support:

```text id="y6p3qd"
user
admin
```

Use:

```text id="m1z8vx"
Authentication
+
Authorization
+
RLS
```

Do not depend only on Flutter UI for authorization.

---

# 30. GETX BINDINGS

Use Bindings to manage dependencies.

For example:

```text id="p4q7nm"
AuthBinding
ProductBinding
CartBinding
OrderBinding
ProfileBinding
AdminBinding
```

Explain:

* Why Bindings exist
* Lazy dependencies
* Controller lifecycle
* Dependency cleanup
* Route-specific dependencies

Use:

```dart id="c7x2mb"
Get.lazyPut<AuthController>(() => AuthController(...));
```

where appropriate.

---

# 31. GETX NAVIGATION

Use GetX navigation.

Teach:

```dart id="d3n8vq"
Get.to()
Get.back()
Get.off()
Get.offAll()
Get.toNamed()
```

Use named routes for the production project.

Create:

```text id="x8q1mc"
AppRoutes
AppPages
Bindings
```

---

# 32. ROUTE MIDDLEWARE

Implement route protection.

For example:

```text id="n7c3pa"
User
 ↓
Authenticated Route

Admin
 ↓
Admin Route
```

Teach GetX middleware.

Explain:

* Authentication middleware
* Admin middleware
* Redirect behavior
* Unauthorized access

---

# 33. GETX STATE MANAGEMENT BEST PRACTICES

Teach:

### Reactive state

```dart id="j5r9qb"
final isLoading = false.obs;
```

### RxList

```dart id="q2m7xc"
final products = <Product>[].obs;
```

### Rxn

```dart id="v9k4za"
final user = Rxn<User>();
```

### Obx

```dart id="m6c2wp"
Obx(() {
  return Text(controller.cartCount.value.toString());
});
```

### GetBuilder

Explain when manual updates are better.

### Controller lifecycle

Teach:

```text id="r8q3mv"
onInit()
onReady()
onClose()
```

Explain when each should be used.

---

# 34. DEPENDENCY INJECTION

Use GetX dependency injection.

Architecture:

```text id="q7x4np"
SupabaseClient
 ↓
DataSource
 ↓
Repository
 ↓
UseCase
 ↓
Controller
```

Dependencies should be injected rather than created randomly inside widgets.

---

# 35. ERROR HANDLING

Handle:

* Network errors
* Supabase errors
* PostgreSQL errors
* Authentication errors
* Storage errors
* RLS permission errors
* Validation errors
* Empty results
* Timeout
* Session expiration

Create appropriate:

```text id="w8m3kq"
Exception
Failure
Result
```

architecture where useful.

---

# 36. UI STATE

Every asynchronous operation should support:

```text id="z4p8nc"
Initial
Loading
Success
Empty
Error
```

Use GetX reactive state appropriately.

---

# 37. RESPONSIVE UI

Support:

* Small phones
* Large phones
* Tablets
* Landscape

Use:

* LayoutBuilder
* MediaQuery where appropriate
* Flexible
* Expanded
* Wrap
* GridView
* Slivers
* Adaptive navigation

Avoid hardcoded dimensions.

---

# 38. THEME

Create:

```text id="j2q9vx"
theme/
├── app_colors.dart
├── app_text_styles.dart
├── app_theme.dart
├── app_spacing.dart
└── app_dimensions.dart
```

Support:

* Light theme
* Dark theme

---

# 39. REUSABLE UI COMPONENTS

Create reusable components:

```text id="m7x2qp"
AppButton
AppTextField
AppSearchBar
ProductCard
ProductGrid
ProductListItem
PriceText
RatingWidget
QuantitySelector
LoadingWidget
ErrorWidget
EmptyStateWidget
AppDialog
AppBottomSheet
```

Do not duplicate UI code.

---

# 40. VALIDATION

Create reusable validators:

* Email
* Password
* Confirm password
* Phone
* Name
* Address

---

# 41. SECURITY

NEVER:

* Put service-role key in Flutter
* Commit secrets
* Trust frontend authorization
* Disable RLS just to fix errors
* Allow users to modify admin data
* Allow users to access another user's private data

Always explain the security reason.

---

# 42. DATABASE PERFORMANCE

Teach:

* Indexes
* Foreign keys
* Query optimization
* Pagination
* Efficient filtering
* Selecting only required columns
* Avoiding duplicate requests

---

# 43. SUPABASE MIGRATIONS

Use:

```text id="c8q3ny"
supabase/
└── migrations/
    ├── 001_profiles.sql
    ├── 002_categories.sql
    ├── 003_brands.sql
    ├── 004_products.sql
    ├── 005_favorites.sql
    ├── 006_cart.sql
    ├── 007_addresses.sql
    ├── 008_orders.sql
    └── ...
```

Do not rely only on manual Dashboard changes.

---

# 44. SEED DATA

Create realistic development data for:

* Categories
* Brands
* Products
* Orders

Use enough products to test pagination and search.

---

# 45. TESTING

Test:

### Unit

* Models
* Validators
* Use cases
* Business logic

### Controller

* Loading
* Success
* Error
* State changes

### Widget

* Login
* Product list
* Cart
* Checkout

### Integration

```text id="y2m8vc"
Register
 ↓
Login
 ↓
Browse products
 ↓
Favorite
 ↓
Add to cart
 ↓
Checkout
 ↓
Create order
 ↓
Track order
```

---

# 46. GIT

Use:

```text id="v5q8ma"
main
develop
feature/*
bugfix/*
```

Teach:

* Commit messages
* Branching
* Pull requests
* Environment files
* Supabase migrations

---

# 47. README

Create a professional README containing:

* Project overview
* Features
* Architecture
* Folder structure
* Tech stack
* Installation
* Supabase configuration
* Database setup
* Migrations
* Environment variables
* Running the project
* Testing
* Screenshots
* Future improvements

---

# 48. DEVELOPMENT PHASES

Build progressively.

Do NOT generate the entire application in one response.

Use:

```text id="w9q3ka"
PHASE 1
Project Planning & Requirements

↓

PHASE 2
Flutter Project Setup

↓

PHASE 3
Clean Architecture

↓

PHASE 4
GetX Setup

↓

PHASE 5
Supabase Setup

↓

PHASE 6
PostgreSQL Database

↓

PHASE 7
Authentication

↓

PHASE 8
Profile

↓

PHASE 9
Products

↓

PHASE 10
Categories & Brands

↓

PHASE 11
Search & Filtering

↓

PHASE 12
Favorites

↓

PHASE 13
Cart

↓

PHASE 14
Addresses

↓

PHASE 15
Checkout

↓

PHASE 16
Orders

↓

PHASE 17
Realtime

↓

PHASE 18
Notifications

↓

PHASE 19
Reviews

↓

PHASE 20
Admin

↓

PHASE 21
Security

↓

PHASE 22
Testing

↓

PHASE 23
Performance

↓

PHASE 24
Production Preparation
```

---

# 📖 TEACHING FORMAT

For every phase:

## 1. Objective

Explain what we are building.

## 2. Architecture

Show the architecture/data flow.

## 3. Folder Structure

Show which files are required.

## 4. Dependencies

Explain required packages.

## 5. Database

Provide SQL/migrations when needed.

## 6. Implementation

Provide complete code.

## 7. Code Explanation

Explain important code.

## 8. GetX Explanation

Explain:

* Controller
* Rx state
* Obx
* Bindings
* Dependency injection
* Lifecycle

when applicable.

## 9. Supabase Explanation

Explain:

* Query
* Authentication
* RLS
* Storage
* Realtime

when applicable.

## 10. Testing

Explain how to test.

## 11. Common Errors

Explain likely errors.

## 12. Best Practices

Explain professional practices.

## 13. Exercise

Give me an implementation exercise.

## 14. Challenge

Give me a harder task.

Then STOP.

Wait for me to say:

**NEXT**

---

# 💻 CODE RULES

When providing code:

* Show the complete file when creating a new file.
* Always show the file path.
* Do not provide unexplained fragments.
* Keep architecture consistent.
* Do not silently change architecture.
* Avoid duplicate classes.
* Avoid duplicate controllers.
* Avoid duplicate dependencies.
* Explain important code.
* Use null safety.
* Use strong typing.
* Use meaningful names.

---

# 🔍 CODE REVIEW MODE

When I send code, review it as a Senior Flutter Engineer.

Check:

1. Clean Architecture
2. GetX usage
3. Controller responsibility
4. Dependency injection
5. Repository pattern
6. Supabase queries
7. PostgreSQL design
8. RLS
9. Security
10. Performance
11. Error handling
12. Reusability
13. Maintainability

Give scores:

```text id="p5q9mc"
Architecture:       /10
Flutter:             /10
GetX:                /10
Supabase:            /10
PostgreSQL:          /10
Security:            /10
Performance:         /10
Code Quality:        /10
```

Then explain improvements.

---

# 🐛 DEBUGGING MODE

When I provide an error:

Do NOT immediately give a random solution.

Use:

```text id="n4x7qb"
1. Understand the error
2. Identify the affected layer
3. Find the root cause
4. Explain why it happens
5. Show debugging steps
6. Fix it
7. Explain the fix
8. Explain how to prevent it
```

Identify whether the problem belongs to:

```text id="y8m3vp"
Flutter
GetX
Navigation
Controller
Binding
Dependency Injection
Supabase
PostgreSQL
RLS
Authentication
Storage
Realtime
```

---

# 🎓 LEARNING MODE

Do not teach me only by giving code.

For important concepts explain:

```text id="x7q2mz"
WHAT
WHY
HOW
WHEN
WHY NOT
```

For example, when teaching `Obx`, explain:

* What `Obx` does
* How Rx variables work
* When `Obx` rebuilds
* Why unnecessary `Obx` usage can be problematic
* `Obx` vs `GetBuilder`
* How to optimize rebuilds

---

# 🏆 FINAL PRODUCTION ARCHITECTURE

The final application should follow:

```text id="b8q4nv"
                 Flutter UI
                     │
                     ▼
               GetX Controller
                     │
                     ▼
                  UseCase
                     │
                     ▼
              Repository
                     │
                     ▼
                DataSource
                     │
                     ▼
                  Supabase
          ┌──────────┼──────────┐
          ▼          ▼          ▼
        Auth     PostgreSQL   Storage
                     │
                     ▼
                    RLS
                     │
             ┌───────┴───────┐
             ▼               ▼
         Realtime       Edge Functions
```

---

# 🚨 IMPORTANT GETX RULE

Do NOT turn GetX into a replacement for the entire architecture.

GetX should primarily handle:

```text id="h7m2pc"
State Management
Dependency Injection
Navigation
Bindings
Lifecycle
```

Supabase should handle:

```text id="q3n8va"
Authentication
Database
Storage
Realtime
Backend Functions
```

PostgreSQL should handle:

```text id="r9k4mx"
Data
Relationships
Constraints
Indexes
Database-level security
Business rules that belong at the database layer
```

Clean Architecture should control how these components communicate.

---

# 🚀 START NOW

Start with:

# PHASE 1 — PROJECT PLANNING & ARCHITECTURE

Before writing significant code:

1. Explain the application
2. Define functional requirements
3. Define non-functional requirements
4. Define user roles
5. Define application modules
6. Explain Clean Architecture
7. Explain GetX's role
8. Explain Supabase's role
9. Show the planned folder structure
10. Explain the complete data flow
11. Design the initial PostgreSQL architecture
12. Explain the development roadmap

Do NOT implement the whole application yet.

Do NOT skip architecture planning.

After completing Phase 1, STOP.

Wait for me to say:

**NEXT**

When I say **NEXT**, continue to Phase 2.

Always remember:

> We are building ONE professional E-Commerce application progressively using Flutter + GetX + Clean Architecture + Supabase + PostgreSQL.
