# Notas de la clase
## CRUD

El comando para crear una nueva aplicación de rails es el siguiente:

`rails new ** Nombre de la aplicación **`

Adicionalmente en este proyecto usamos docker para los contenedores que emulan el ambiente del servidor
### MIGRACIONES

  Los modelos son la representación de nuestra BD en la aplicación,
  y es donde debe ir la lógica de negocio, si tienes dudas sobre si lo que estas programando debe o no ir en el modelo pregúntate
  este código resuelve o representa algo de la lógica del negocio?, 
  si la respuesta es si deberás colocarlo en el modelo.

  El comando para crear un modelo es:

  `rails generate model (nombre del modelo en singular) (campo1:tipocampo1) (campo2:tipocampo2)`

  Las migraciones se crean automaticamente después de generar el modelo, 
  las migraciones son archivos que contienen instrucciones para crear y modificar la estructura de la base de datos,
  se encuentran en la carpeta DB>Migration y se ejecutan en base al tiempo.

  El comando para crear una migración es:

  `rails generate migration () (campo1:tipocampo1) (campo2:tipocampo2)`

  El comando para aplicar las instrucciones de la migración a la base de datos es:

  `rails db:migrate`

  El comando para deshacer un cambio aplicado por la migración a la base de datos es:

  `rails db:rollback`

  Si tenemos la necesidad de deshacer mas que el ultimo cambio podemos usar:

  `rails db:rollback STEP=<Numero de pasos hacia atrás>`

  Una vez que tengamos nuestra bd creada podemos entrar en la consola de comandos interactiva de rails con el siguiente comando:

  `rails console`

  Dentro de esta consola de comandos podemos hacer uso de los modelos que el proyecto posee, y para crear una nueva instancia de la clase se usa

  `variable1 = NombreDelModelo.new`

  El comando .new crea una instancia en memoria ram de la clase con los valores vacíos o por defecto y para ir asignando valores podemos usar lo siguiente:

  `variable1.nombreDelAtributo = valor`

  al hacer eso hacemos que la instancia de la clase que esta en memoria ram guarde los valores de los atributos que estamos definiendo,
  esto lo podemos corroborar con el método persisted? (que responde false si el objeto o instancia de la clase no esta guardada en la BD),
  esta y muchos otros métodos se pueden usar en la instancia de la clase ya que esta hereda de **ApplicationRecord**,
  para persistir estos cambios en la base de datos se usa:

  `variable1.save`
### CONTROLADORES

  Los controladores son quienes resuelven la petición, el comando para generar el controlador es:

  `rails generate (nombre del controlador que se asocia al modelo en plural) (acciones)`

  dentro de acciones puedes colocar (index new) por ejemplo

  dentro del controlador en el método index se pueden definir variables de instancia, 
  recordemos que las variables de instancia se define con @variable y esta variable la tendremos directamente en la vista,
  en la cual podremos acceder de la misma manera (@variable) y trabajar con ella por ejemplo haciendo un each para mostrar todos los registros.

  ``` [ruby]
  def index
    @courses = Course.all
  end
  ```

  ``` [ruby]
  <% @courses.each do |course| %>

    <li>
      <%= link_to course.title, show_course_path(id:course)%>
      <%= course.title %>
    </li>

  <%end%>
  ```

### FORMULARIOS

  Los formularios en rails se crean con la etiqueta form_with, existen otras etiquetas que puedes usar en caso de que tu formulario no tenga
  relación con un modelo - form_tag, form_with viene siendo una función a la que le pasas parámetros, en rails los paréntesis son opcionales

  siempre que un formulario sea enviado al rails en el controlador existirá uns variable params que recibe todos los datos del formulario enviado

### STRONG PARAMS

  Los strong params son un mecanismo que nos permite limitar cuales son los atributos que se pueden recibir mediante los formularios

  ``` [ruby]
  def course_params
    params.required(:course).permit(:title, :description, :published, :visible)
  end
  ```
