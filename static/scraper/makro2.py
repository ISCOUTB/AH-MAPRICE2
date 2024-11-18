from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, TimeoutException, StaleElementReferenceException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd

import time

# Configuración del navegador y ruta del ChromeDriver

driver = webdriver.Chrome()

# URL de la página de Makro
url = 'https://www.carulla.com/despensa'
driver.get(url)

try:
    # Esperar hasta que el contenedor con los productos esté visible
    WebDriverWait(driver, 90).until(
        EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div.infinite-scroll-component'))
    )



    # Hacer scroll hacia abajo hasta el final de la página
    last_height = driver.execute_script("return document.body.scrollHeight")

    while True:
        # Desplazar la página hacia abajo
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(2)  # Esperar para que la página cargue nuevos productos

        # Comprobar si hemos llegado al final
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height


    # Encontrar todos los elementos de productos en la página
    product_elements = driver.find_elements(By.CSS_SELECTOR, 'div.card-product-vertical')
    print(f"Cantidad de productos encontrados: {len(product_elements)}")

    with open('output.txt', 'w', encoding='utf-8') as file:
    # Iterar a través de cada producto y escribir el HTML en el archivo

        for i, element in enumerate(product_elements):
            file.write(f"Producto {i + 1}:\n")
            file.write(element.get_attribute('outerHTML'))
            file.write("\n\n" + "="*50 + "\n\n")

    print("Resultados guardados en 'output.txt'")
    
    data = []

    # Iterar a través de cada producto para extraer nombre y precio
    for element in product_elements:
        try:
            # Buscar los elementos de título y precio dentro de cada producto individual
            titulo_element = element.find_element(By.CSS_SELECTOR, 'p.CardName__CardNameStyles-sc-147zxke-0.prod__name')
            precio_element = element.find_element(By.CSS_SELECTOR, 'p.CardBasePrice__CardBasePriceStyles-sc-1dlx87w-0.base__price')
            
            # Agregar los datos al diccionario
            data.append({
                'Titulo': titulo_element.text,
                'Precio': precio_element.text
            })
        except (NoSuchElementException, StaleElementReferenceException):
            pass  # Si no se encuentra el nombre o el precio, pasar al siguiente producto

    # Guardar los datos en un archivo CSV
    df = pd.DataFrame(data)
    df.to_csv('productos_makro_canasta.csv', index=False)
    print("Datos guardados en 'productos_d1.csv'")

except TimeoutException:
    print("No se encontraron los productos en el tiempo esperado.")

finally:
    driver.quit()
