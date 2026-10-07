<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- Titre dynamique selon le mode --%>
    <c:choose>
        <c:when test="${not empty department}">
            <title>Modifier département | ClinicManager</title>
        </c:when>
        <c:otherwise>
            <title>Nouveau département | ClinicManager</title>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- BREADCRUMB --%>
        <nav class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <a href="${pageContext.request.contextPath}/admin/departments"
               class="hover:text-[#00A8E8] transition-colors">
                Départements
            </a>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
            </svg>
            <span class="text-gray-800 font-semibold">
                <c:choose>
                    <c:when test="${not empty department}">Modifier</c:when>
                    <c:otherwise>Nouveau</c:otherwise>
                </c:choose>
            </span>
        </nav>

        <%-- TOPBAR --%>
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">
                <c:choose>
                    <c:when test="${not empty department}">Modifier le département</c:when>
                    <c:otherwise>Nouveau département</c:otherwise>
                </c:choose>
            </h1>
            <p class="text-gray-500 text-sm mt-1">
                <c:choose>
                    <c:when test="${not empty department}">
                        Modifiez les informations du département.
                    </c:when>
                    <c:otherwise>
                        Créez un nouveau département pour la clinique.
                    </c:otherwise>
                </c:choose>
            </p>
        </div>

        <%-- MESSAGE D'ERREUR --%>
        <c:if test="${not empty requestScope.error}">
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${requestScope.error}"/></p>
            </div>
        </c:if>

        <%-- FORMULAIRE --%>
        <div class="bg-white shadow-md max-w-2xl">

            <%-- Action et méthode dynamiques --%>
            <c:set var="formAction" value="${empty department ? 'new' : 'edit'}"/>

            <form action="${pageContext.request.contextPath}/admin/departments/${formAction}"
                  method="POST"
                  class="p-8 space-y-6">

                <%-- Champ caché pour l'id (seulement en mode Update) --%>
                <c:if test="${not empty department}">
                    <input type="hidden" name="id" value="${department.id}"/>
                </c:if>

                <%-- Champ Nom --%>
                <div>
                    <label for="name" class="block text-sm font-semibold text-gray-700 mb-2">
                        Nom du département <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
                            </svg>
                        </div>

                        <%-- Value : department.name (update) OU name (re-essai create) OU vide --%>
                        <c:set var="currentName"
                               value="${not empty department ? department.name : requestScope.name}"/>

                        <input type="text"
                               id="name"
                               name="name"
                               required
                               maxlength="100"
                               value="<c:out value='${currentName}'/>"
                               placeholder="Ex : Cardiologie, Pédiatrie, Urgences..."
                               class="w-full pl-11 pr-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                    </div>
                    <p class="text-xs text-gray-400 mt-2">
                        Le nom doit être unique (insensible à la casse).
                    </p>
                </div>

                <%-- BOUTONS --%>
                <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
                    <a href="${pageContext.request.contextPath}/admin/departments"
                       class="px-6 py-3 text-sm font-bold text-gray-600
                              hover:bg-gray-100 transition-colors uppercase tracking-wider">
                        Annuler
                    </a>
                    <button type="submit"
                            class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                                   text-white font-bold px-6 py-3 transition-colors
                                   text-sm uppercase tracking-wider shadow-lg shadow-[#00A8E8]/30">

                        <%-- Icône dynamique --%>
                        <c:choose>
                            <c:when test="${not empty department}">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                </svg>
                                Modifier
                            </c:when>
                            <c:otherwise>
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                                </svg>
                                Enregistrer
                            </c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>