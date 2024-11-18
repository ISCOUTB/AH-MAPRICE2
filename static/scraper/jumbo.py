from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, TimeoutException, StaleElementReferenceException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains


# Configuración del navegador y ruta del ChromeDriver
driver = webdriver.Chrome()

# URL de la página de Jumbo
url = 'https://www.tiendasjumbo.co/supermercado/despensa'
driver.get(url)

# Esperar hasta que el contenedor con los productos esté visible
WebDriverWait(driver, 90).until(
    EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div#gallery-layout-container'))
)

# Guardar los datos en un archivo CSV
data = []

while True:
    try:
        # Obtener todos los productos en la página actual
        product_elements = driver.find_elements(By.CSS_SELECTOR, 'div.tiendasjumboqaio-cmedia-integration-cencosud-0-x-galleryItem')
        print(f"Cantidad de productos encontrados en esta página: {len(product_elements)}")

        # Iterar a través de cada producto para extraer nombre y precio
        for element in product_elements:
            try:
                titulo_element = element.find_element(By.CSS_SELECTOR, 'span.vtex-product-summary-2-x-productBrand.vtex-product-summary-2-x-brandName')
                precio_element = element.find_element(By.CSS_SELECTOR, 'div.tiendasjumboqaio-jumbo-minicart-2-x-price')

                # Agregar los datos al diccionario
                data.append({
                    'Titulo': titulo_element.text.strip(),
                    'Precio': precio_element.text.strip()
                })
            except (NoSuchElementException, StaleElementReferenceException):
                pass  # Si no se encuentra el nombre o el precio, continuar con el siguiente producto

        # Intentar hacer clic en el siguiente botón del paginador (botón con flecha)
        try:
            # Encontrar todos los botones de paginación
            pagination_buttons = driver.find_elements(By.CSS_SELECTOR, 'ul.vtex-slider-0-x-sliderFrame li button.tiendasjumboqaio-jumbo-fetch-more-paginator-0-x-buttonPerPage')

            # Asegurarse de que hay botones de paginación disponibles
            if pagination_buttons:
                for button in pagination_buttons:
                    try:
                        # Verificar si el botón tiene el número 49
                        if button.text == "49":
                            print("Se ha llegado a la página 49, cerrando el bucle.")
                            break  # Romper el bucle si se llega a la página 49
                        
                        # Hacer clic en cada botón (debe ser el botón de la página siguiente)
                        button.click()
                        print(f"Se ha hecho clic en el botón de página: {button.text}")
                        time.sleep(2)  # Esperar un poco antes de hacer clic en el siguiente botón
                    except Exception as e:
                        print(f"Error al hacer clic en el botón de la página: {e}")
            else:
                print("No se encontraron botones de paginación.")

        except Exception as e:
            print(f"Error al intentar hacer clic en el siguiente botón: {e}")
            break

    except Exception as e:
        print(f"Error al cargar productos o cambiar de página: {e}")
        break

# Guardar los datos en un archivo CSV
df = pd.DataFrame(data)
df.to_csv('productos_jumbo.csv', index=False)
print("Datos guardados en 'productos_jumbo.csv'")

driver.quit()
