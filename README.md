**MealDbApp**

In order to get packages used on this project, you can run with "flutter pub get" to terminal after cloning. 

This project contains basic usage of dio,cubit,shared preferences.

Check for more about themealdb api : https://www.themealdb.com/

<pre>
# Project tree

├───core
│   ├───base
│   │   └───model
│   ├───components
│   ├───constants
│   │   ├───app
│   │   ├───endpoints
│   │   ├───enums
│   │   ├───image
│   │   ├───navigation
│   │   └───themes
│   ├───extension
│   └───init
│       ├───cache
│       ├───di
│       ├───navigation
│       └───network
│           └───network_core
├───feature
│   ├───categories
│   │   ├───cubit
│   │   ├───model
│   │   ├───service
│   │   └───view
│   ├───categories_details
│   │   ├───cubit
│   │   ├───model
│   │   ├───service
│   │   └───view
│   ├───food_details
│   │   ├───cubit
│   │   ├───service
│   │   └───view
│   ├───home
│   │   ├───cubit
│   │   ├───model
│   │   │   ├───categories
│   │   │   ├───populer-items
│   │   │   └───random-food
│   │   ├───service
│   │   └───view
│   ├───my_favorite
│   │   ├───cubit
│   │   ├───model
│   │   └───view
│   └───search
│       ├───cubit
│       ├───service
│       └───view
└───product
    ├───utils
    └───widget
    
    
</pre> 
