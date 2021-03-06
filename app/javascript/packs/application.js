import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../js/custom'
import '../stylesheets/application'
import "@fortawesome/fontawesome-free/css/all"

require('./components/TodoApp')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
