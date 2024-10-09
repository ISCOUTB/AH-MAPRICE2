def scrape_product_data(product_name):
    # Simulación de productos como datos de prueba
    products = [
        {'name': 'Laptop', 'price': '$500', 'location': 'Tienda A'},
        {'name': 'Smartphone', 'price': '$300', 'location': 'Tienda B'},
        {'name': 'Tablet', 'price': '$200', 'location': 'Tienda C'}
    ]
    
    # Filtrar los productos que coinciden con el nombre del producto buscado
    filtered_products = [product for product in products if product_name.lower() in product['name'].lower()]
    return filtered_products

if __name__ == "__main__":
    # Cambia "Laptop" por cualquier producto que quieras buscar
    product_name = "Laptop"
    scraped_data = scrape_product_data(product_name)
    
    if scraped_data:
        print("Productos encontrados:")
        for product in scraped_data:
            print(f"Nombre: {product['name']}, Precio: {product['price']}, Ubicación: {product['location']}")
    else:
        print("No se encontraron productos.")

