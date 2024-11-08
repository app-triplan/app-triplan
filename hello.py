import pandas as pd

# Define the structured task data
tasks = [
    {"Task Name": "Install required libraries (Django, REST Framework, etc.)", "Days": 2, "Week Number": 1, "Priority Level": "High", "Sprint Association": "Sprint 1", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Set up database connections", "Days": 1, "Week Number": 1, "Priority Level": "High", "Sprint Association": "Sprint 1", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Create core Django apps (itineraries, users, etc.)", "Days": 1, "Week Number": 1, "Priority Level": "High", "Sprint Association": "Sprint 1", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Install Flutter dependencies and libraries", "Days": 1, "Week Number": 1, "Priority Level": "High", "Sprint Association": "Sprint 1", "Status": "To-Do", "Category": "Frontend"},
    {"Task Name": "Ensure VS Code environment is configured", "Days": 1, "Week Number": 1, "Priority Level": "High", "Sprint Association": "Sprint 1", "Status": "To-Do", "Category": "Frontend"},
    
    {"Task Name": "Set up basic API structure in Django REST Framework", "Days": 2, "Week Number": 2, "Priority Level": "High", "Sprint Association": "Sprint 2", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Create serializers for each model", "Days": 2, "Week Number": 2, "Priority Level": "Medium", "Sprint Association": "Sprint 2", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Define models for itineraries, users, trips, etc.", "Days": 2, "Week Number": 2, "Priority Level": "High", "Sprint Association": "Sprint 2", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Perform migrations and test data integration", "Days": 1, "Week Number": 2, "Priority Level": "High", "Sprint Association": "Sprint 2", "Status": "To-Do", "Category": "Backend"},
    
    {"Task Name": "Create CRUD for Itinerary API", "Days": 3, "Week Number": 3, "Priority Level": "High", "Sprint Association": "Sprint 3", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Implement Itinerary list view with basic design", "Days": 2, "Week Number": 3, "Priority Level": "High", "Sprint Association": "Sprint 3", "Status": "To-Do", "Category": "Frontend"},
    {"Task Name": "Set up navigation between main screens", "Days": 1, "Week Number": 3, "Priority Level": "High", "Sprint Association": "Sprint 3", "Status": "To-Do", "Category": "Frontend"},
    
    {"Task Name": "Build detailed itinerary page (CRUD for activities)", "Days": 3, "Week Number": 4, "Priority Level": "High", "Sprint Association": "Sprint 4", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Integrate document upload for itineraries (images, PDFs)", "Days": 2, "Week Number": 4, "Priority Level": "High", "Sprint Association": "Sprint 4", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Create registration and login views in backend", "Days": 2, "Week Number": 4, "Priority Level": "High", "Sprint Association": "Sprint 4", "Status": "To-Do", "Category": "Backend"},
    
    {"Task Name": "Integrate frontend login screen with authentication API", "Days": 1, "Week Number": 5, "Priority Level": "High", "Sprint Association": "Sprint 5", "Status": "To-Do", "Category": "Frontend"},
    {"Task Name": "Style itinerary screens for better UX", "Days": 2, "Week Number": 5, "Priority Level": "Medium", "Sprint Association": "Sprint 5", "Status": "To-Do", "Category": "Frontend"},
    {"Task Name": "Design and implement profile page", "Days": 1, "Week Number": 5, "Priority Level": "Medium", "Sprint Association": "Sprint 5", "Status": "To-Do", "Category": "Frontend"},
    {"Task Name": "Functional testing on backend endpoints", "Days": 2, "Week Number": 5, "Priority Level": "High", "Sprint Association": "Sprint 5", "Status": "To-Do", "Category": "Testing"},
    {"Task Name": "UI testing on frontend screens", "Days": 1, "Week Number": 5, "Priority Level": "High", "Sprint Association": "Sprint 5", "Status": "To-Do", "Category": "Testing"},
    
    {"Task Name": "Push notifications integration", "Days": 2, "Week Number": 6, "Priority Level": "Medium", "Sprint Association": "Sprint 6", "Status": "To-Do", "Category": "Backend"},
    {"Task Name": "Final testing and debugging", "Days": 3, "Week Number": 6, "Priority Level": "High", "Sprint Association": "Sprint 6", "Status": "To-Do", "Category": "Testing"},
    
    {"Task Name": "Prepare assets for App Store submission", "Days": 1, "Week Number": 7, "Priority Level": "High", "Sprint Association": "Sprint 7", "Status": "To-Do", "Category": "Deployment"},
    {"Task Name": "Submit app to App Store", "Days": 1, "Week Number": 8, "Priority Level": "High", "Sprint Association": "Sprint 8", "Status": "To-Do", "Category": "Deployment"},
    {"Task Name": "Monitor app feedback and address issues", "Days": 3, "Week Number": 8, "Priority Level": "High", "Sprint Association": "Sprint 8", "Status": "To-Do", "Category": "Deployment"},
]

# Convert to DataFrame
df_tasks = pd.DataFrame(tasks)

# Display the DataFrame to the user
import ace_tools as tools; tools.display_dataframe_to_user(name="Triplan App Development Task Schedule", dataframe=df_tasks)