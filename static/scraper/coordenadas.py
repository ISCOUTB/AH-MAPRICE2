import requests

API_KEY = 'AIzaSyCCI1PAoZvDoxKFJoe8aG9iG0AaPPs6pCA'
query = 'jumbo en cartagena'
url = f'https://maps.googleapis.com/maps/api/place/textsearch/json?query={query}&key={API_KEY}'

response = requests.get(url)
data = response.json()

for place in data['results']:
    print(f"Nombre: {place['name']}, Coordenadas: {place['geometry']['location']}")
