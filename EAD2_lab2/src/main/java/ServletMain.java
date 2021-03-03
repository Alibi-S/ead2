import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/main")
public class ServletMain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.getRequestDispatcher("index.jsp").forward(req, resp);
}}
/*
Create an Application to handle Login and Registration forms using Java Servlets.

Create at least 3 jsp pages - for main page, login page and registration page.
Create servlets to handle requests from these pages.
Create a connecting links between pages
Create a form with required fields for login and registration pages.
Handle the form submission using servlet, just output the information for now (no need to store the submitted data for now)
Try to add styling to your pages
Submission

Push your App to git repository
Add project description on project README
Take a screenshot of your running application
Push the screenshot to git repository as well
Submit the git repository link here

----------

Создайте приложение для обработки форм входа и регистрации с помощью сервлетов Java.

Создайте как минимум 3 страницы jsp - для главной страницы, страницы входа и страницы регистрации.
Создайте сервлеты для обработки запросов с этих страниц.
Создавайте соединительные ссылки между страницами
Создайте форму с обязательными полями для страниц входа и регистрации.
Обработайте отправку формы с помощью сервлета, просто выведите информацию на данный момент
(пока нет необходимости хранить отправленные данные)
Попробуйте добавить стиль на свои страницы
Подчинение

Отправьте свое приложение в репозиторий git
Добавить описание проекта в README
Сделайте снимок экрана вашего запущенного приложения
Также отправьте снимок экрана в репозиторий git
Отправьте ссылку на репозиторий git здесь
*/