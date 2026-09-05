# Senior Flutter E-Commerce App — Production-Ready Architecture Prompt

Act as a **Senior Flutter Software Architect and Senior Flutter Developer**.

I want you to design and build a **production-ready, scalable, maintainable E-Commerce mobile application** using:

* Flutter
* Dart
* GetX for State Management, Dependency Injection, and Routing
* Supabase as Backend
* PostgreSQL through Supabase
* Supabase Authentication
* Supabase Storage
* Supabase Row Level Security (RLS)
* Clean Architecture principles
* Feature-first project structure
* Responsive UI
* Light / Dark / System theme
* Multi-language / Localization
* Reusable UI components
* Form validation
* Error handling
* Loading / Empty / Error states
* Secure authentication
* Scalable database architecture

The project must be structured as if it will be maintained by a **professional development team** for several years.

---

# 1. Main Objective

Build an E-Commerce application with a clean architecture that can easily scale from a small application into a large production application.

The architecture must make it easy to:

* Add new features
* Replace implementations
* Add new screens
* Add new APIs
* Add new database tables
* Add new languages
* Add new themes
* Add new payment providers
* Add new user roles
* Add new business rules
* Write unit tests
* Write widget tests
* Write integration tests
* Maintain code with multiple developers

Avoid creating a simple tutorial-style Flutter project.

Do NOT put everything inside:

```text
lib/main.dart
```

Do NOT put business logic directly inside widgets.

Do NOT create a giant controller.

Do NOT duplicate UI components.

---

# 2. Recommended Architecture

Use a combination of:

```text
Clean Architecture
+
Feature-First Architecture
+
Repository Pattern
+
GetX
+
Dependency Injection
```

Use this general dependency direction:

```text
Presentation
    ↓
Domain
    ↓
Data
```

The dependency direction must never be reversed.

For example:

```text
UI
 ↓
Controller
 ↓
UseCase
 ↓
Repository Interface
 ↓
Repository Implementation
 ↓
DataSource
 ↓
Supabase
```

---

# 3. Recommended Project Structure

Create a structure similar to:

```text
lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── routes/
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   │
│   ├── bindings/
│   │   └── initial_binding.dart
│   │
│   └── config/
│       ├── app_config.dart
│       └── environment.dart
│
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── api_constants.dart
│   │   └── storage_constants.dart
│   │
│   ├── errors/
│   │   ├── app_exception.dart
│   │   ├── failure.dart
│   │   └── error_handler.dart
│   │
│   ├── network/
│   │   ├── network_info.dart
│   │   └── supabase_client.dart
│   │
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── storage_service.dart
│   │   ├── localization_service.dart
│   │   └── theme_service.dart
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── light_theme.dart
│   │   ├── dark_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_dimensions.dart
│   │
│   ├── localization/
│   │   ├── translations.dart
│   │   ├── en_us.dart
│   │   ├── km_kh.dart
│   │   └── language_controller.dart
│   │
│   ├── utils/
│   │   ├── validators.dart
│   │   ├── formatters.dart
│   │   ├── currency_formatter.dart
│   │   ├── date_formatter.dart
│   │   └── responsive_utils.dart
│   │
│   └── widgets/
│       ├── app_button.dart
│       ├── app_text_field.dart
│       ├── app_dropdown.dart
│       ├── app_card.dart
│       ├── app_dialog.dart
│       ├── app_snackbar.dart
│       ├── app_loader.dart
│       ├── app_error_view.dart
│       ├── app_empty_view.dart
│       ├── product_card.dart
│       ├── category_card.dart
│       ├── price_text.dart
│       └── responsive_layout.dart
│
├── features/
│
│   ├── authentication/
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
│   ├── cart/
│   ├── favorites/
│   ├── checkout/
│   ├── orders/
│   ├── profile/
│   ├── addresses/
│   ├── reviews/
│   └── notifications/
│
└── shared/
    ├── models/
    ├── enums/
    └── extensions/
```

Each feature should follow the same internal structure.

---

# 4. Feature Architecture

For example, the Product feature should look like:

```text
features/products/

├── data/
│   ├── datasources/
│   │   └── product_remote_datasource.dart
│   │
│   ├── models/
│   │   └── product_model.dart
│   │
│   └── repositories/
│       └── product_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── product.dart
│   │
│   ├── repositories/
│   │   └── product_repository.dart
│   │
│   └── usecases/
│       ├── get_products.dart
│       ├── get_product.dart
│       ├── search_products.dart
│       └── get_products_by_category.dart
│
└── presentation/
    ├── bindings/
    │   └── product_binding.dart
    │
    ├── controllers/
    │   └── product_controller.dart
    │
    ├── pages/
    │   ├── product_list_page.dart
    │   └── product_detail_page.dart
    │
    └── widgets/
        ├── product_card.dart
        ├── product_grid.dart
        └── product_filter.dart
```

Follow this pattern consistently.

---

# 5. GetX Architecture

Use GetX for:

### State Management

Use:

```dart
Obx()
Rx()
RxList()
RxBool()
RxInt()
RxString()
```

Use controllers for presentation state.

Example responsibility:

```text
ProductController
    ↓
UI state
    ↓
calls UseCase
    ↓
receives result
    ↓
updates Rx state
```

Controllers must NOT directly contain Supabase queries.

Bad:

```dart
class ProductController extends GetxController {
  final products = <Product>[].obs;

  Future<void> loadProducts() async {
    final data = await Supabase.instance.client
        .from('products')
        .select();

    products.value = ...
  }
}
```

Do not use this architecture.

Instead:

```text
ProductController
        ↓
GetProductsUseCase
        ↓
ProductRepository
        ↓
ProductRepositoryImpl
        ↓
ProductRemoteDataSource
        ↓
Supabase
```

---

# 6. GetX Dependency Injection

Use GetX Bindings.

Example:

```text
InitialBinding
ProductBinding
CartBinding
AuthBinding
OrderBinding
```

Dependencies should be registered only where necessary.

Avoid:

```dart
Get.put(SomeController());
```

everywhere inside widgets.

Use bindings for lifecycle management.

---

# 7. GetX Routing

Use named routes:

```text
/splash
/login
/register
/home
/products
/products/:id
/categories
/cart
/checkout
/orders
/orders/:id
/profile
/addresses
/favorites
```

Centralize routes in:

```text
app/routes/
```

Use middleware where appropriate.

For example:

```text
AuthMiddleware
GuestMiddleware
AdminMiddleware
```

Do not duplicate authentication checks inside every page.

---

# 8. Supabase Architecture

Use Supabase as the backend.

The application should use:

```text
Supabase Auth
Supabase PostgreSQL
Supabase Storage
Supabase Realtime
Supabase RLS
```

Create a centralized Supabase client/service.

Do not scatter:

```dart
Supabase.instance.client
```

throughout the entire application.

Use a data source layer.

Example:

```text
ProductRemoteDataSource
        ↓
Supabase
```

---

# 9. Database Design

Design a professional PostgreSQL schema for:

```text
profiles
categories
brands
products
product_images
favorites
cart_items
addresses
orders
order_items
notifications
reviews
```

Consider additional tables when required, such as:

```text
product_variants
coupons
payments
wishlists
order_status_history
```

Do not add unnecessary tables without explaining why.

---

# 10. Database Relationships

Design proper relationships.

Example:

```text
profiles
    │
    ├── addresses
    ├── favorites
    ├── cart_items
    ├── orders
    ├── reviews
    └── notifications

categories
    │
    └── products

brands
    │
    └── products

products
    │
    ├── product_images
    ├── cart_items
    ├── favorites
    ├── order_items
    └── reviews

orders
    │
    └── order_items
```

Use:

* Primary keys
* Foreign keys
* Unique constraints
* Check constraints
* Not-null constraints
* Indexes
* Timestamps
* Appropriate cascade rules

Explain the reason for every important database decision.

---

# 11. Supabase Authentication

Implement:

```text
Register
Login
Logout
Forgot Password
Reset Password
Email Verification
Session Management
Current User
Authentication State
```

Architecture:

```text
AuthController
      ↓
AuthUseCase
      ↓
AuthRepository
      ↓
AuthRemoteDataSource
      ↓
Supabase Auth
```

Never store passwords manually in the application database.

Use Supabase Auth.

---

# 12. Row Level Security

Use Supabase RLS.

Define realistic rules.

Examples:

### Profiles

A user can:

```text
SELECT own profile
UPDATE own profile
```

### Cart

A user can:

```text
SELECT own cart
INSERT own cart
UPDATE own cart
DELETE own cart
```

### Favorites

A user can manage only their own favorites.

### Orders

A customer can view only their own orders.

### Reviews

A user can create reviews only according to the business rules.

Explain all RLS policies.

Never rely only on Flutter-side authorization.

Security must be enforced at the database level.

---

# 13. Theme System

Implement three theme modes:

```text
Light
Dark
System
```

The user should be able to select:

```text
☀ Light
🌙 Dark
⚙ System
```

Use GetX for theme state.

Create:

```text
ThemeService
ThemeController
AppTheme
LightTheme
DarkTheme
```

Persist the selected theme locally.

The UI must react immediately when the theme changes.

Do not hardcode colors inside widgets.

Bad:

```dart
color: Colors.blue
```

Prefer:

```dart
color: Theme.of(context).colorScheme.primary
```

or centralized application colors/tokens.

---

# 14. Localization

Support multiple languages.

At minimum:

```text
English
Khmer
```

The architecture must allow adding:

```text
Chinese
Thai
Vietnamese
Korean
etc.
```

without modifying every screen.

Create:

```text
LocalizationService
LanguageController
Translations
```

Allow users to change language from Settings.

Persist the selected language.

Never hardcode user-facing text directly throughout widgets.

Instead use translation keys.

Example:

```dart
'login'.tr
```

---

# 15. Responsive Design

The application must work correctly on:

```text
Small phones
Large phones
Tablets
Foldable devices
Landscape
Desktop/Web if supported
```

Do not design only for one phone resolution.

Create reusable responsive utilities.

For example:

```text
ResponsiveLayout
ResponsiveBuilder
ScreenSize
Breakpoints
```

Use responsive breakpoints such as:

```text
Mobile
Tablet
Desktop
```

Product layouts should automatically adapt.

Example:

```text
Mobile:
2-column product grid

Tablet:
3-column product grid

Desktop:
4–6 column product grid
```

Avoid hardcoded screen sizes.

Use:

```dart
MediaQuery
LayoutBuilder
Expanded
Flexible
Wrap
GridView
SliverGrid
```

appropriately.

---

# 16. Reusable Components

Create a reusable design system.

Examples:

```text
AppButton
AppTextField
AppDropdown
AppCheckbox
AppRadio
AppCard
AppDialog
AppBottomSheet
AppSnackbar
AppLoader
AppErrorView
AppEmptyView
AppImage
AppNetworkImage
AppSearchBar
AppAppBar
ProductCard
CategoryCard
CartItemCard
OrderCard
PriceText
RatingWidget
QuantitySelector
```

Do not duplicate these components across features.

If a component is used by multiple features, place it in:

```text
core/widgets/
```

If it is specific to one feature, place it inside:

```text
features/<feature>/presentation/widgets/
```

---

# 17. UI State Handling

Every asynchronous screen should support:

```text
Initial
Loading
Success
Empty
Error
Refreshing
Pagination
```

For example:

```text
Loading
    ↓
Success → display products

Loading
    ↓
Empty → display empty state

Loading
    ↓
Error → display retry state
```

Do not leave users with a blank screen during loading.

Create reusable:

```text
LoadingWidget
ErrorWidget
EmptyWidget
RetryWidget
```

---

# 18. Product Features

Implement:

```text
Product Listing
Product Detail
Product Search
Product Filtering
Product Sorting
Category Filtering
Brand Filtering
Price Filtering
Product Images
Product Rating
Product Reviews
Related Products
Pagination
Pull-to-refresh
```

Search should be designed so it can scale to a large product catalog.

---

# 19. Shopping Cart

Implement:

```text
Add to Cart
Remove from Cart
Update Quantity
Calculate Subtotal
Calculate Discount
Calculate Shipping
Calculate Total
Cart Validation
Stock Validation
```

Important business rule:

```text
Never trust price or total calculated by Flutter.
```

The backend/database should validate important order values.

---

# 20. Checkout

Create a proper checkout flow:

```text
Cart
 ↓
Address
 ↓
Shipping
 ↓
Payment
 ↓
Order Confirmation
```

Separate:

```text
UI state
Business logic
Payment logic
Order creation
```

Do not place the entire checkout process in one controller.

---

# 21. Orders

Support:

```text
Create Order
Order List
Order Detail
Order Status
Order Items
Order History
Cancel Order
Track Order
```

Possible statuses:

```text
pending
confirmed
processing
shipped
delivered
cancelled
```

Use enums rather than arbitrary strings throughout Dart code.

---

# 22. Favorites

Implement:

```text
Add Favorite
Remove Favorite
Favorite List
Check Favorite Status
```

Use optimistic UI only where appropriate, with rollback if the backend operation fails.

---

# 23. Reviews

Implement:

```text
Create Review
Update Review
Delete Review
Rating
Review List
Average Rating
```

Apply realistic business rules.

For example:

```text
A customer should only be allowed to review products according to the order/purchase rules.
```

Enforce important rules on the backend.

---

# 24. Error Handling

Create centralized error handling.

Handle:

```text
Network Error
Authentication Error
Database Error
Validation Error
Permission Error
Timeout
Unexpected Error
Storage Error
```

Do not expose raw Supabase/database errors directly to users.

Convert technical exceptions into user-friendly messages.

Architecture:

```text
Exception
   ↓
Failure
   ↓
Controller
   ↓
UI Message
```

---

# 25. Validation

Create reusable validators:

```text
EmailValidator
PasswordValidator
RequiredValidator
PhoneValidator
NameValidator
PriceValidator
QuantityValidator
```

Validation must exist at:

```text
UI level
+
Business logic level
+
Database level where appropriate
```

Never rely only on Flutter validation.

---

# 26. Image Handling

Use Supabase Storage for:

```text
Profile Images
Product Images
Category Images
Brand Images
```

Create a storage service.

Handle:

```text
Upload
Delete
Update
Public URLs
Signed URLs where appropriate
Image loading
Image errors
Image caching
```

Do not place storage implementation directly inside UI widgets.

---

# 27. Pagination

Product lists and other large collections must support pagination.

Do not load thousands of records at once.

Use:

```text
limit
offset
cursor/keyset pagination where appropriate
```

Implement:

```text
Initial Load
Load More
Refreshing
End of List
Pagination Error
```

---

# 28. Performance

Follow Flutter performance best practices.

Avoid unnecessary rebuilds.

Use:

```text
const widgets
Obx only where necessary
Lazy controllers
Pagination
Image caching
Debounced search
Efficient lists
Slivers when appropriate
```

Do not rebuild an entire screen when only one small value changes.

---

# 29. Security

Follow real-world security practices.

Never put:

```text
Supabase service_role key
private API secrets
payment secrets
admin secrets
```

inside the Flutter application.

Only use public client credentials intended for the client application.

Security-sensitive operations must happen on the backend.

Use RLS properly.

Validate all important operations server-side.

---

# 30. Environment Configuration

Support different environments:

```text
Development
Staging
Production
```

Do not hardcode environment-specific configuration.

Create an appropriate configuration system for:

```text
Supabase URL
Supabase anon/public key
API configuration
Environment flags
```

Explain what is safe to include in the Flutter client and what must remain server-side.

---

# 31. Repository Pattern

Every feature that communicates with Supabase should use repositories.

Example:

```text
ProductRepository
```

Interface:

```dart
abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
  Future<Result<Product>> getProduct(String id);
}
```

Implementation:

```text
ProductRepositoryImpl
```

This allows the application to replace Supabase later if required.

---

# 32. Use Cases

Business operations should be represented by use cases when useful.

Examples:

```text
LoginUser
RegisterUser
LogoutUser
GetProducts
GetProduct
SearchProducts
AddToCart
RemoveFromCart
UpdateCartQuantity
CreateOrder
GetOrders
AddFavorite
RemoveFavorite
CreateReview
```

A use case should have one clear responsibility.

Avoid creating meaningless use cases for every trivial getter.

Use judgment based on actual business complexity.

---

# 33. Models and Entities

Separate:

```text
Entity
Model
```

Example:

```text
Product
```

Domain entity:

```text
Product
```

Data model:

```text
ProductModel
```

The model should handle:

```text
fromJson()
toJson()
```

Do not let Supabase-specific structures leak into the domain layer.

---

# 34. State Model

Use a consistent state representation.

For example:

```text
Status:
initial
loading
success
empty
error
```

Create reusable state patterns where appropriate.

Do not use random boolean combinations like:

```dart
isLoading
isError
hasData
isEmpty
```

if they can result in contradictory states.

---

# 35. Code Quality Rules

Follow these rules:

### Naming

Use meaningful names.

Bad:

```text
x
data1
abc
temp
```

Good:

```text
product
selectedCategory
cartItems
totalAmount
```

### Files

Keep files focused.

Avoid files with 1000+ lines.

### Controllers

Controllers should not become "god classes".

Split large features into smaller responsibilities.

### Widgets

Keep widgets small and reusable.

### Comments

Do not comment obvious code.

Comment important business decisions.

---

# 36. Dependency Management

Use appropriate packages, but do not add packages unnecessarily.

Potential packages may include:

```text
get
supabase_flutter
cached_network_image
intl
flutter_secure_storage
connectivity_plus
```

Only introduce a package when it provides clear value.

Before adding a package:

1. Explain why it is needed.
2. Explain alternatives.
3. Use the package only where appropriate.

---

# 37. Testing Architecture

Prepare the project for:

```text
Unit Tests
Widget Tests
Integration Tests
```

At minimum, design testable:

```text
UseCases
Repositories
Controllers
Validators
Formatters
Business Rules
```

Example:

```text
test/
├── core/
├── features/
│   ├── authentication/
│   ├── products/
│   ├── cart/
│   └── orders/
└── integration/
```

---

# 38. Git-Friendly Architecture

The project will be developed by multiple developers.

Structure the code so developers can work independently.

Example ownership:

```text
Developer A
    authentication
    profile
    addresses

Developer B
    products
    categories
    favorites

Developer C
    cart
    checkout
    orders
```

Shared architecture:

```text
core/
app/
shared/
```

should have clear ownership and coding rules.

Avoid unnecessary changes to shared files.

---

# 39. Real-World Business Rules

Do not build only the UI.

Think about real-world rules such as:

```text
User cannot checkout an empty cart.

Product must be active before it can be purchased.

Product quantity cannot exceed available stock.

Order price must be validated by backend.

User cannot access another user's order.

User cannot modify another user's cart.

User cannot modify another user's address.

Review permissions must be validated.

Cancelled orders cannot be arbitrarily changed back to delivered.

Product deletion should consider existing order history.

```

Document important business rules.

---

# 40. Loading and Error UX

Every network operation should have appropriate feedback.

Examples:

```text
Button Loading
Page Loading
Skeleton Loading
Pull-to-refresh
Retry
Snackbar
Dialog
Empty State
Error State
```

Avoid showing a global loading indicator for every small operation.

Use local loading states where appropriate.

---

# 41. Offline and Network Considerations

Design the application so that network failures are handled gracefully.

For example:

```text
No Internet
    ↓
Show meaningful message
    ↓
Retry
```

For appropriate data, consider caching.

Do not claim an operation succeeded until the server confirms it.

---

# 42. Application Navigation Flow

Design the complete navigation:

```text
Splash
 ↓
Check Session
 ↓
 ┌───────────────┐
 │               │
Logged In     Logged Out
 │               │
Home          Login
                 ↓
              Register
```

Main application:

```text
Home
├── Categories
├── Products
├── Product Detail
├── Search
├── Favorites
├── Cart
├── Orders
├── Notifications
└── Profile
     ├── Addresses
     ├── Language
     ├── Theme
     └── Logout
```

---

# 43. Bottom Navigation

Use a clean navigation structure such as:

```text
Home
Categories
Favorites
Cart
Profile
```

The selected tab must persist appropriately during navigation.

Do not recreate unnecessary controllers every time the tab changes.

---

# 44. Product UI

Design a professional E-Commerce UI.

Product card should support:

```text
Product Image
Product Name
Brand
Price
Discount Price
Rating
Favorite Button
Add to Cart
Stock Status
```

Make it responsive.

Avoid overloading the card with too much information.

---

# 45. Design System

Create centralized design tokens:

```text
Colors
Typography
Spacing
Border Radius
Elevation
Icons
Button Sizes
Input Heights
Breakpoints
```

Example:

```text
AppSpacing.xs
AppSpacing.sm
AppSpacing.md
AppSpacing.lg
AppSpacing.xl
```

Do not randomly use:

```dart
padding: EdgeInsets.all(17)
```

throughout the application.

Use consistent design tokens.

---

# 46. Accessibility

Consider:

```text
Readable text
Semantic labels
Touch target sizes
Color contrast
Keyboard navigation where applicable
Screen reader support
```

Do not rely only on color to communicate important information.

---

# 47. Deliverables

When generating the project, provide the implementation in this order:

## Phase 1

Project architecture.

## Phase 2

Dependencies.

## Phase 3

Supabase configuration.

## Phase 4

Database schema.

## Phase 5

RLS policies.

## Phase 6

Authentication.

## Phase 7

Theme system.

## Phase 8

Localization.

## Phase 9

Reusable design system.

## Phase 10

Products and categories.

## Phase 11

Favorites.

## Phase 12

Cart.

## Phase 13

Checkout.

## Phase 14

Orders.

## Phase 15

Profile and addresses.

## Phase 16

Notifications.

## Phase 17

Reviews.

## Phase 18

Error handling and validation.

## Phase 19

Testing.

## Phase 20

Performance and security review.

---

# 48. Important Development Rule

Do NOT generate the entire application as one giant response.

Build the project incrementally.

For every phase:

1. Explain the architecture.
2. Show the folder structure.
3. Create the required files.
4. Provide complete code.
5. Explain how the files communicate.
6. Explain where each file belongs.
7. Explain how to run/test it.
8. Check for architecture problems before moving to the next phase.

Do not move to the next phase until the current phase is internally consistent.

---

# 49. Code Generation Rules

When writing code:

* Use null safety.
* Follow Dart conventions.
* Prefer composition over inheritance where appropriate.
* Keep classes focused.
* Avoid duplicated code.
* Avoid magic numbers.
* Avoid magic strings.
* Avoid hardcoded UI text.
* Avoid direct Supabase calls from widgets.
* Avoid direct Supabase calls from controllers.
* Avoid business logic inside widgets.
* Avoid giant controllers.
* Avoid global mutable state unless justified.
* Use dependency injection.
* Use repositories.
* Use proper error handling.
* Make code testable.
* Make code production-ready.

---

# 50. Final Architecture Goal

The final architecture should conceptually look like:

```text
                    FLUTTER APP
                         │
              ┌──────────┴──────────┐
              │                     │
         Presentation            Core
              │                     │
       ┌──────┼──────┐       ┌──────┼──────┐
       │      │      │       │      │      │
      Page Controller Binding Theme  Utils Widgets
       │      │
       └──────┤
              ↓
           UseCase
              ↓
       Repository Interface
              ↓
       Repository Implementation
              ↓
          DataSource
              ↓
           Supabase
              │
      ┌───────┼────────┐
      ↓       ↓        ↓
   Auth   PostgreSQL  Storage
              │
             RLS
```

The application should be:

```text
Clean
Scalable
Maintainable
Testable
Secure
Responsive
Reusable
Modular
Production-ready
Team-friendly
```

Before writing implementation code, first provide:

1. Complete architecture explanation
2. Complete folder structure
3. Dependency list
4. Supabase architecture
5. PostgreSQL ERD concept
6. Authentication flow
7. GetX state-management strategy
8. Theme architecture
9. Localization architecture
10. Responsive design strategy
11. Reusable component strategy
12. Security strategy
13. RLS strategy
14. Git/team development strategy
15. Development phases

Then begin implementation phase by phase.
