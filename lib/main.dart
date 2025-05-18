import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Flutter Tutorial', home: Scaffold(
    body: Center(child: ShoppingList(
      products: [
        Product(name: 'Egg'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    )),
  )));
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        centerTitle: true,
      ),
      body: ListView(
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
}) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangeCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name,  style: _getStyle(context)),
    );
  }
}



typedef CartChangeCallback = Function(Product product, bool inCart);

class Product {
  Product({required this.name});

  final String name;
}



// class ShoppingList extends StatefulWidget {
//   const ShoppingList({required this.products, super.key});
//
//   final List<Product> products;
//
//   /* The framework calls createState first time a widget appear at a given
//   location in the tree. If the parent rebuilds and uses a same type of widget
//   with the same key, the framework re-uses the same Same state object instead
//   of creating a new State object.
//   */
//
//   @override
//   State<ShoppingList> createState() => _ShoppingListState();
// }
//
// class _ShoppingListState extends State<ShoppingList> {
//
//   final _shoppingCart = <Product>{};
//
//   void _handleCartChanged(Product product, bool inCart) {
//     setState(() {
//
//       /* When a user changes whats in the cart, you need to change _shoppingCart
//       inside a setState call to trigger a rebuild. The framework then calls
//       build below which update the visual appearance of the app.
//       */
//
//       if (!inCart) {
//         _shoppingCart.add(product);
//       } else {
//         _shoppingCart.remove(product);
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping List'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         children: widget.products.map((product) {
//           return ShoppingListItem(
//               product: product,
//               inCart: _shoppingCart.contains(product),
//               onCartChange: _handleCartChanged);
//         }).toList(),
//       ),
//
//     );
//   }
// }
//
//
// class ShoppingListItem extends StatelessWidget {
//   ShoppingListItem({
//     required this.product,
//     required this.inCart,
//     required this.onCartChange,
// }) : super(key: ObjectKey(product));
//
//   final Product product;
//   final bool inCart;
//   final CartChangedCallback onCartChange;
//
//   Color _getColor(BuildContext context) {
//     /* The theme depends on the BuildContext because different parts of the
//     widget tree can have different themes. The BuildContext indicate where the
//     build is taking place therefore which theme to use.
//     */
//     return inCart
//         ? Colors.black54
//         : Theme.of(context).primaryColor;
//   }
//
//   TextStyle? _getTextStyle(BuildContext context) {
//     if(!inCart) return null;
//
//     return const TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         onCartChange(product, inCart);
//       },
//       leading: CircleAvatar(
//         backgroundColor: _getColor(context),
//         child: Text(product.name[0]),
//       ),
//       title: Text(product.name, style: _getTextStyle(context)),
//     );
//   }
// }
//
//
// typedef CartChangedCallback = Function(Product product, bool inCart);
//
// class Product {
//   const Product({required this.name});
//
//   final String name;
// }





