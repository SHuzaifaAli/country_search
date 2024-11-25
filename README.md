Folder Structure Breakdown:

1. lib/main.dart - Entry point of the Flutter application.

2. models/country.dart - Defines the Country data model.

3. repository/country_repository.dart Handles API communication.

4. bloc/ Contains BLOC components for managing state and business logic:

• country_bloc.dart

• country_event.dart

• country_state.dart

5. screens/search_screen.dart - The main Ul component where users interact.

6. widgets/country_tile.dart - Reusable widget to display country information.

----------------------------------------------------------------------------------------

1. main.dart Application Entry Point

This file initializes the app and sets up the Bloc Provider:
• Purpose: Initializes the app and injects the CountryBloc into the widget tree using BlocProvider.

• Key Functionality: Ensures that the BLOC instance is available throughout the app lifecycle.

2. models/country.dart - Data Model

Defines the structure of a Country object:
• Purpose: Represents the country data fetched from the API.

• Key Functionality: Provides a fromJson factory constructor to parse JSON data into Country objects.

3. repository/country_repository.dart - Data Fetching Logic

Handles communication with the REST Countries API:
• Purpose: Abstracts the logic for fetching data from the API.

• Key Functionality: Makes HTTP requests, parses JSON responses, and converts them into a list of Country objects.

4. BLOC Components:

BLOC is composed of three main files:

bloc/country_event.dart - Defines Events
• Purpose: Defines user-triggered actions. In this case, FetchCountries is dispatched when the user searches for a country.

• Key Functionality: Provides a structure to pass user input (query) to the BLOC.

bloc/country_state.dart - Defines States
• Purpose: Represents different states of the UI (initial, loading, loaded, and error states).

• Key Functionality: Facilitates state management, allowing the Ul to react based on the current state.

bloc/country_bloc.dart - Business Logic Controller
• Purpose: Contains the business logic, handling the conversion of events into states.

• Key Functionality: Manages asynchronous data fetching and error handling, updating the state based on the result.

5. screens/search_screen.dart - User Interface with Debounce

This file creates the search screen and handles debounce logic:
• Debounce Logic: Uses a Timer to delay API calls until the user has stopped typing for 500 milliseconds, reducing unnecessary requests.

• BlocBuilder: Rebuilds the Ul based on the current state of the BLOC.

6. widgets/country_tile.dart - Reusable Widget

Displays country information in a list tile:
• Purpose: Provides a consistent way to display country details, such as the flag, name, and region.
