import requests
from bs4 import BeautifulSoup

def scrape_product_data(product_name):
    url = f"https://ejemplo.com/search?q={product_name}"
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    products = []
    for item in soup.find_all('div', class_='product-item'):
        name = item.find('h2').text
        price = item.find('span', class_='price').text
        location = item.find('span', class_='location').text
        products.append({'name': name, 'price': price, 'location': location})

    return products
