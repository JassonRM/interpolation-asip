# Created by Edgar
from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
import cv2
import numpy as np
import threading

# Algunas variables globales.
ubicacion = ""
x = 0
y = 0
methods_list = ["(Ninguna interpolación)", "Interpolación por el vecino más cercano",
                " Interpolación bilineal"]

###########################

# Esta funcion es llamada por el boton de codificar una imagen en un archivo de texto. Crea un hilo para que openCV pueda abrir la imagen sin que todo el programa se cierre.
def abrirImagenCodificar():
    hiloCod = threading.Thread(target=abriendoImagenCod)
    hiloCod.start()


###########################
# Esta funcion abre una ventana para que el usuario pueda abrir una imagen y esta pueda ser convertida a escala de grises, codificada y guardado estos datos en un archivo de texto.
def abriendoImagenCod():
    try:
        root.filename = filedialog.askopenfilename(initialdir="/home", title="Seleccione la imagen a procesar",
                                                   filetypes=(("jpeg", "*jpeg"), ("png", "*png"), ("all files", "*.*")))
        print(root.filename)
    except:
        messagebox.showwarning("Alto! No ha elegido un archivo.")

    buffer1 = ""
    # imagen = cv2.imread("/home/edgar/Desktop/pythonFiles/1.png")

    try:
        imagen = cv2.imread(root.filename)
        imagen_gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)
        rows, cols = imagen_gris.shape
        f = open("C:/Users/WPC/Documents/viewer/imagenGris1.txt", "w")
        f.write("DEPTH = " + str(rows*cols) + "; \n")
        f.write("WIDTH = 8;\n")
        f.write("ADDRESS_RADIX = DEC;\n")
        f.write("DATA_RADIX = DEC;\n")
        f.write("CONTENT\n")
        f.write("BEGIN\n")
        contador = 0
        for i in range(rows):
            for j in range(cols):
                if (j < cols - 1) or (i < rows - 1):
                    f.write(str(contador) + ":" + str(imagen_gris[i, j]) + ";\n")
                    buffer1 += str(imagen_gris[i, j]) + ","
                else:
                    f.write(str(contador) + ":" + str(imagen_gris[i, j]) + ";\n")
                    buffer1 += str(imagen_gris[i, j])
                contador += 1
        f.write("END;")
        #f = open("/home/edgar/Desktop/Proyecto-Edgar-Chaves/imagenGris1.txt", "w")
        #f.write(buffer1)
        f.close()
        cv2.imshow(str(cols) + "x" + str(rows), imagen)
        cv2.imshow(str(cols) + "x" + str(rows), imagen_gris)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
    except:
        messagebox.showwarning("Alto!", "No ha elegido un archivo.")


###########################
# Esta funcion crea una ventana auxiliar donde se ingresan las dimensiones de la imagen a decodificar. Esta funcion lee un archivo de texto plano y la convierte a imagen y es mostraada por openCV.
def ventanaDecodificar():
    ventanDeco = Toplevel(root)
    ventanDeco.title("Decodificar imagen")
    ventanDeco.geometry("400x400")
    etiquetaExplicativa = Label(ventanDeco, text="Ingrese las dimensiones de la imagen a decodificar:").place(x=10,
                                                                                                              y=10)
    try:
        dimensionX = IntVar()

        etiquetaX = Label(ventanDeco, text="Ingrese la dimension x").place(x=10, y=40)
        Xcaja = Entry(ventanDeco, textvariable=dimensionX).place(x=170, y=40)

        dimensionY = IntVar()
        etiquetaY = Label(ventanDeco, text="Ingrese la dimension y").place(x=10, y=80)
        Ycaja = Entry(ventanDeco, textvariable=dimensionY).place(x=170, y=80)
    except ValueError:
        messagebox.showwarning("Cuidado", "No puede haber una imagen sin dimensiones")

    var = StringVar(ventanDeco)
    var.set(methods_list[0])
    OptionMenu(ventanDeco, var, *methods_list).place(x=75, y=110)

    if var.get() == methods_list[1]:
        print(methods_list[1])



    botonObtieneRuta = Button(ventanDeco, text="Abrir archivo",
                              command=lambda: deco(dimensionX.get(), dimensionY.get(), var.get())).place(x=10, y=150)


###########################
# Esta funcion es llamada por el boton de decodificacion. Ademas esta funcion crea un hilo para que la ventana que usa openCV para mostrar la imagen y no se cierrren todas las ventanas creadas.
def deco(x, y, interpolacion):
    hiloDeco = threading.Thread(target=decodificando, args=(x, y, interpolacion))
    hiloDeco.start()


###########################
# Esta funcion toma un archivo de texto plano y lo convierte en la imagen.
def decodificando(x, y, interpolacion):
    print(interpolacion)
    if x == 0 or y == 0:
        messagebox.showwarning("Cuidado", "No puede haber una imagen sin dimensiones")

    else:
        root.filename = filedialog.askopenfilename(initialdir="/home", title="Seleccione un archivo para decodificar",
                                                   filetypes=(("txt", "*txt"), ("all files", "*.*")))

        x = x // 4
        y = y // 4
        if interpolacion == methods_list[1]:  # Nearest neighbor
            x = 2 * x
            y = 2 * y
        elif interpolacion == methods_list[2]:  # Bilineal
            x = (x * 3) - 2
            y = (y * 3) - 2
        else:
            x = x * 4
            y = y * 4
        intern_list = x * y

        print(x)
        print(y)
        try:
            # Opening file:
            file = open(root.filename)
            cols = x
            rows = y
            # Reading file:
            buffer1 = file.read()
            print(buffer1)
            # Getting the length of the buffer from file:
            len_buffer = len(buffer1)
            print(len_buffer)
            numero = 0
            string = ""
            # Getting the len of de buffer in bytes:
            len_buffer1 = len_buffer // 8
            indexLista = 0
            # Building a empty list of buffer in bytes length:
            list_ = np.zeros((1, len_buffer1), np.uint8)
            # Setting the list as intiger type:
            list_.astype(int)
            i = 0
            # Iterate over the buffer:
            while i < len_buffer1:
                # Read 1 byte:
                j = i * 8
                while j < i * 8 + 8:
                    # Building 1 byte:
                    string += buffer1[j]
                    j += 1
                # Convert 1 byte in integer:
                pixel = int(string, base=2)
                # Saving the pixel in the list_:
                list_[0, i] = pixel * 100
                i += 1
                string = ""
            list_.astype(int)
            # Building a matrix of zeros, with output image size
            matriz = np.zeros((rows, cols), np.uint8)
            # matriz = np.zeros((cols,rows), np.uint8)
            largoLista = len(list_[0])
            fila = 0
            columna = 0
            # for i in range(largoLista):intern_list
            # Building the matrix that will conform the final image:
            for i in range(intern_list):
                if columna == cols - 1:
                    matriz[fila, columna] = list_[0, i]
                    columna = 0
                    fila += 1
                elif fila == rows - 1:
                    break
                else:
                    matriz[fila, columna] = list_[0, i]
                    columna += 1

            cv2.imshow("prueba", matriz)
            cv2.waitKey(0)
            cv2.destroyWindow("prueba")
        except:
            messagebox.showwarning("Alto!", "No ha elegido un archivo.")


###########################
# Configuracion general para la ventana principal.
root = Tk()
root.title("Codificador y Decodificador de Imagenes")
root.geometry("700x100")
# Boton que llama a la funcion de abrir imagen y decodificar.
botonCodificarImagen = Button(root, text="Abrir imagen", command=abrirImagenCodificar).place(x=20, y=50)
etiquetaCodificarImagen = Label(root,
                                text="Para abrir una imagen y codificar \n la imagen presione el boton de abajo.").place(
    x=10, y=10)

# Boton que llama a la funcion de decodificar en donde se ingresan los valores de la dimension X y Y de la imagen.
botonDecodificarArchivo = Button(root, text="Abrir archivo", command=lambda: ventanaDecodificar()).place(x=400, y=50)
etiquetaDecodificarImagen = Label(root,
                                  text="Para abrir un archivo de codificacion \n de imagen presione el boton de abajo.").place(
    x=400, y=10)
root.mainloop()