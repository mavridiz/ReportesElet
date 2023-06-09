<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <hr>
        <h2><center><b>Pagina del Ingeniero</b></center></h2>
        </hr>


        <h2><center><b><br><br>Reportes Pendientes</br></br></b></center></h2

      
        <div class="min-h-full">

            <header class="bg-white">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-2xl font-bold leading-tight tracking-tight text-gray-900">Reportes pendientes</h1>
                </div>
            </header>
            <main>
                <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <main>
                                        <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                                            <!-- Replace with your content -->
                                            <div class="px-4 py-4 sm:px-0">
                                                <div class="px-4 sm:px-6 lg:px-8">
                                                    <div class="sm:flex sm:items-center">
                                                        <div class="sm:flex-auto">
                                                            <h1 class="text-xl font-semibold text-gray-900">Reportes</h1>
                                                            <p class="mt-2 text-sm text-gray-700">Aquí se mostrarán todos los reportes cerrados o solucionados para su redacción en formato FAQ</p>
                                                        </div>
                                                        <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">

                                                        </div>
                                                    </div>
                                                    <%
                                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                                        Connection dbConnection = null;
                                                        try {
                                                            String url = "jdbc:mysql://localhost:3306/elet";
                                                            String user = "root";
                                                            String pwd = "n0m3l0";
                                                            dbConnection = DriverManager.getConnection(url, user,pwd);
                                                            Statement statement = null;
                                                            ResultSet rs = null;

                                                            statement = dbConnection.createStatement();
                                                            String SQLQuery = "";
                                                            rs = statement.executeQuery(SQLQuery);

                                                    %>
                                                    <div class="mt-8 flex flex-col">
                                                        <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                                            <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                                                <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                                                                    <table class="min-w-full divide-y divide-gray-300">
                                                                        <thead class="bg-gray-50">
                                                                            <tr>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">ID de usuario</th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"><!--Aquí pones tus encabezados de tablas--></th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"><!--Aquí pones tus encabezados de tablas--></th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"><!--Aquí pones tus encabezados de tablas--></th>
                                                                                <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"><!--Aquí pones tus encabezados de tablas--></th>

                                                                                <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                                                                                    <a href="">
                                                                                        <span class="sr-only">Redactar</span>
                                                                                    </a>
                                                                                </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody class="divide-y divide-gray-200 bg-white">
                                                                            <%
                                                                                while (rs.next()) {

                                                                                    Integer id_usuario /*En vez de id_user vas a poner el nombre de la variable para Java que necesites*/ = rs.getInt("id_user"); /*En vez de usr_id vas a poner el nombre del campo en MySQL que ocupes*/
                                                                                    Integer id_case = rs.getInt("case_id");
                                                                                    String username_report = rs.getString("user_name");
                                                                                    String report_name = rs.getString("case_name");
                                                                                    String status_report = rs.getString("case_status");
                                                                                    String last_update_date = rs.getString("case_last_update_date");
                                                                            %>
                                                                            <tr>
                                                                                <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"><%=id_usuario%></td> <!--En vez de id_user vas a poner el nombre de la variable en Java que vas a desplegar -->
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=username_report%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=report_name%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=status_report%></td>
                                                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=last_update_date%></td>
                                                                                <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                                                                                    <a href="editor_form.jsp" class="text-indigo-600 hover:text-indigo-900">----<span class="sr-only"></span></a>
                                                                                </td>
                                                                            </tr>                
                                                                            <%
                                                                                        }
                                                                                        statement.close();
                                                                                        dbConnection.close();
                                                                                    
                                                                                } catch (SQLException e) {
                                                                                    out.println("SQLException caught: " + e.getMessage());
                                                                                }
                                                                            %>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                    </main>
                                </div>              
                            </div>
                            </body>
                            </html>
