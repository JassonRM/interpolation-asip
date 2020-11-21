from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
import cv2
import numpy as np
import threading

# This is a sample Python script.

# Press Mayús+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

methods_list = ["(Ninguna interpolación)", "Interpolación por el vecino más cercano",
                " Interpolación bilineal"]


def ventanaDecodificar():
    ventanDeco = Toplevel(root)
    ventanDeco.title("Decodificar imagen")
    ventanDeco.geometry("400x200")
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


def deco(x, y, interpolacion):
    hiloDeco = threading.Thread(target=decodificando, args=(x, y, interpolacion))
    hiloDeco.start()


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
        # Opening file:
        try:
            file = open(root.filename)
     
            cols = x
            rows = y
            # Reading file:
            image = []

            for i in range(x*y):
                pixel = file.readline()
                image.append(int(pixel, 2))

            matriz = np.array(image).astype(np.uint8).reshape((x, y))

            cv2.imshow("prueba", matriz)
            cv2.waitKey(0)
            cv2.destroyWindow("prueba")
        except:
            messagebox.showwarning("Alto!", "Archivo invalido.")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    root = Tk()
    root.title("Visualizador de Imagenes")
    root.geometry("250x100")
    # Boton que llama a la funcion de decodificar en donde se ingresan los valores de la dimension X y Y de la imagen.
    botonDecodificarArchivo = Button(root, text="Abrir archivo", command=lambda: ventanaDecodificar()).place(x=75, y=50)
    etiquetaDecodificarImagen = Label(root,
                                      text="Para abrir un archivo de codificacion \n de imagen presione el boton de abajo.").place(
        x=0, y=10)
    root.mainloop()
