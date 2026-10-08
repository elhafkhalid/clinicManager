<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <c:choose>
        <c:when test="${not empty availability and not empty availability.id}">
            <title>Modifier disponibilité | ClinicManager</title>
        </c:when>
        <c:otherwise>
            <title>Nouvelle disponibilité | ClinicManager</title>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/doctor-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- Mode : Update si availability a un id --%>
        <c:set var="isEdit" value="${not empty availability and not empty availability.id}"/>

        <%-- BREADCRUMB --%>
        <nav class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <a href="${pageContext.request.contextPath}/doctor/availabilities"
               class="hover:text-emerald-600 transition-colors">
                Disponibilités
            </a>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
            </svg>
            <span class="text-gray-800 font-semibold">
                <c:choose>
                    <c:when test="${isEdit}">Modifier</c:when>
                    <c:otherwise>Nouvelle</c:otherwise>
                </c:choose>
            </span>
        </nav>

        <%-- TOPBAR --%>
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">
                <c:choose>
                    <c:when test="${isEdit}">Modifier la disponibilité</c:when>
                    <c:otherwise>Nouvelle disponibilité</c:otherwise>
                </c:choose>
            </h1>
            <p class="text-gray-500 text-sm mt-1">
                <c:choose>
                    <c:when test="${isEdit}">Modifiez le créneau horaire.</c:when>
                    <c:otherwise>Définissez un créneau horaire récurrent.</c:otherwise>
                </c:choose>
            </p>
        </div>

        <%-- ERREUR --%>
        <c:if test="${not empty requestScope.error}">
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${requestScope.error}"/></p>
            </div>
        </c:if>

        <%-- FORMULAIRE --%>
        <div class="bg-white shadow-md max-w-2xl">

            <%-- Action dynamique --%>
            <c:set var="formAction" value="${isEdit ? 'edit' : 'new'}"/>

            <form action="${pageContext.request.contextPath}/doctor/availabilities/${formAction}"
                  method="POST"
                  class="p-8 space-y-6">

                <%-- Champ caché id (mode Update) --%>
                <c:if test="${isEdit}">
                    <input type="hidden" name="id" value="${availability.id}"/>
                </c:if>

                <%-- Priorité : requestScope (erreur) > availability (update initial) > vide --%>

                <%-- JOUR --%>
                <div>
                    <label for="jour" class="block text-sm font-semibold text-gray-700 mb-2">
                        Jour de la semaine <span class="text-red-500">*</span>
                    </label>

                    <c:set var="currentJour"
                           value="${not empty requestScope.jour ? requestScope.jour
                                    : (not empty availability ? availability.jour : '')}"/>

                    <select id="jour" name="jour" required
                            class="w-full px-4 py-3 border border-gray-300
                                   focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/30
                                   outline-none transition-all text-sm bg-white cursor-pointer">
                        <option value="">-- Sélectionner --</option>
                        <option value="MONDAY"    ${currentJour == 'MONDAY'    ? 'selected' : ''}>Lundi</option>
                        <option value="TUESDAY"   ${currentJour == 'TUESDAY'   ? 'selected' : ''}>Mardi</option>
                        <option value="WEDNESDAY" ${currentJour == 'WEDNESDAY' ? 'selected' : ''}>Mercredi</option>
                        <option value="THURSDAY"  ${currentJour == 'THURSDAY'  ? 'selected' : ''}>Jeudi</option>
                        <option value="FRIDAY"    ${currentJour == 'FRIDAY'    ? 'selected' : ''}>Vendredi</option>
                        <option value="SATURDAY"  ${currentJour == 'SATURDAY'  ? 'selected' : ''}>Samedi</option>
                        <option value="SUNDAY"    ${currentJour == 'SUNDAY'    ? 'selected' : ''}>Dimanche</option>
                    </select>
                </div>

                <%-- HEURES --%>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div>
                        <label for="heureDebut" class="block text-sm font-semibold text-gray-700 mb-2">
                            Heure de début <span class="text-red-500">*</span>
                        </label>
                        <c:set var="currentDebut"
                               value="${not empty requestScope.heureDebut ? requestScope.heureDebut
                                        : (not empty availability ? availability.heureDebut : '')}"/>
                        <input type="time" id="heureDebut" name="heureDebut" required
                               value="<c:out value='${currentDebut}'/>"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/30
                                      outline-none transition-all text-sm"/>
                    </div>

                    <div>
                        <label for="heureFin" class="block text-sm font-semibold text-gray-700 mb-2">
                            Heure de fin <span class="text-red-500">*</span>
                        </label>
                        <c:set var="currentFin"
                               value="${not empty requestScope.heureFin ? requestScope.heureFin
                                        : (not empty availability ? availability.heureFin : '')}"/>
                        <input type="time" id="heureFin" name="heureFin" required
                               value="<c:out value='${currentFin}'/>"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/30
                                      outline-none transition-all text-sm"/>
                    </div>
                </div>

                <%-- BOUTONS --%>
                <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
                    <a href="${pageContext.request.contextPath}/doctor/availabilities"
                       class="px-6 py-3 text-sm font-bold text-gray-600
                              hover:bg-gray-100 transition-colors uppercase tracking-wider">
                        Annuler
                    </a>
                    <button type="submit"
                            class="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600
                                   text-white font-bold px-6 py-3 transition-colors
                                   text-sm uppercase tracking-wider shadow-lg shadow-emerald-500/30">
                        <c:choose>
                            <c:when test="${isEdit}">
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
                                Ajouter
                            </c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>