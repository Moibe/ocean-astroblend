import gradio as gr
import funciones
import bridges

def iniciar():
    print("Lanzando bloque.")
    demo.launch(root_path="/mango", server_port=7860)

def greet(name):
    #Conexión con API principal: 
    result = funciones.consulta(name)
    return f"Hola, el resultado es {result} - {name}."

with gr.Blocks() as demo:
    name = gr.Textbox(label="Name")
    output = gr.Textbox(label="Output Box")
    greet_btn = gr.Button("Greet")
    greet_btn.click(fn=greet, inputs=name, outputs=output, api_name="greet")

iniciar()
