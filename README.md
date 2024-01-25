# clinica_patient

A centralised medical record system📃 (Patient's App)

Applications where doctors and patients will operate in two different applications which are connected 💯
Patients will be able to carry just an application everytime they go to hospitals which have been integrated to the system, that is, patients will have all their lifetime medical records from all the hospitals in just their one stop application 📱
Pateints will be able to search their records by date picker and will be able to view the physical reocrds, symptoms, dosages, interacted doctor, doctor's recommendations and the hospital which they went at that moment in each of the record🎯
Moreover, there is a profile where patients will be able to set their personal information and their long term symptoms and allergic medicines📌

The interaction between patients app and doctors app is implemented with QR code and QR scannner system.
Patients will have a screen for QR code which is inside holds the ID of their account.
Doctors on the others hand will have to scan for the Hospital's QR code at the initial before they operate under the current hospital for their assigned period👤
As the authentication, they will only operate with the current hospital data and will be only able to use the app by passing the OR scanning under current hospital.
In Interaction with patients, doctors will scan the QR of the patients and will be able to view patient's profile, and their records history which doctors the patient communicated with and which hospital they got cured🏥 Moreover the doctor will be able to view each patient record details and will be able to add new records for the current treatment 📌
Doctors will have their own profile and will be able to view the records by date and date picker which they made under the current hospital during the assigned period✔️

 - the project is implemented with two apps of patients and doctors and a website for the hospital dashboard and all are connected to a database system.
 - Patients ans doctor login system is implemented with JWT token. That is, both users will be sign up by the hospital from the dashboards and will have to login from their respective devices. Once they are authenticated, they will recive an JWT token from backend and will be stored in local device storage and the token will be lost only if they logout from the account. Then, for any actions of the user perfrom within the system, these stored JWT tokens will be added as the authorization to API to interact with backend.
 - The project is connected with the MongoDB database and binded with the custom API from the backend backend developer from the team. Both "Post" and "Get" methods are used in binding the API💯
 - Login credentials are posted to backend and get the token back for authentication
 - On creating a new medical record, the record is encoded to json formate and send to backend to store in database💾
 - Selected date from date picker is sent to backend to filter the records in order to search records by date and fetch records back from API.
 - QR code and QR scanner for pateints and  doctors communication are implemented
 - After Scanning session, the records are automatically fetch with Get method from API✔️

![Untitled design (15)](https://github.com/LyNNxMooon/Patient-s-Clinica/assets/112456534/7e636284-b583-4b75-bee6-6819cb91f89d)
![Untitled design (16)](https://github.com/LyNNxMooon/Patient-s-Clinica/assets/112456534/21e94267-49e6-47a3-9e69-e50764b4d174)



