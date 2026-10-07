<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvelle disponibilité | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/doctor-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- BREADCRUMB --%>
        <nav class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <a href="${pageContext.request.contextPath}/doctor/availabilities"
               class="hover:text-emerald-600 transition-colors">
                Disponibilités
            </a>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
            </svg>
            <span class="text-gray-800 font-semibold">Nouvelle</span>
        </nav>

        <%-- TOPBAR --%>
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">Nouvelle disponibilité</h1>
            <p class="text-gray-500 text-sm mt-1">Définissez un créneau horaire récurrent.</p>
        </div>

        <%-- ERREUR --%>
        <c:if test="${not empty requestScope.error}">
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${requestScope.error}"/></p>
            </div>
        </c:if>

        <%-- FORMULAIRE --%>
        <div class="bg-white shadow-md max-w-2xl">
            <form action="${pageContext.request.contextPath}/doctor/availabilities/new"
                  method="POST"
                  class="p-8 space-y-6">

                <%-- JOUR --%>
                <div>
                    <label for="jour" class="block text-sm font-semibold text-gray-700 mb-2">
                        Jour de la semaine <span class="text-red-500">*</span>
                    </label>
                    <select id="jour" name="jour" required
                            class="w-full px-4 py-3 border border-gray-300
                                   focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/30
                                   outline-none transition-all text-sm bg-white cursor-pointer">
                        <option value="">-- Sélectionner --</option>
                        <option value="MONDAY"    ${jour == 'MONDAY'    ? 'selected' : ''}>Lundi</option>
                        <option value="TUESDAY"   ${jour == 'TUESDAY'   ? 'selected' : ''}>Mardi</option>
                        <option value="WEDNESDAY" ${jour == 'WEDNESDAY' ? 'selected' : ''}>Mercredi</option>
                        <option value="THURSDAY"  ${jour == 'THURSDAY'  ? 'selected' : ''}>Jeudi</option>
                        <option value="FRIDAY"    ${jour == 'FRIDAY'    ? 'selected' : ''}>Vendredi</option>
                        <option value="SATURDAY"  ${jour == 'SATURDAY'  ? 'selected' : ''}>Samedi</option>
                        <option value="SUNDAY"    ${jour == 'SUNDAY'    ? 'selected' : ''}>Dimanche</option>
                    </select>
                </div>

                <%-- HEURES --%>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="heureDebut" class="block text-sm font-semibold text-gray-700 mb-2">
                            Heure de début <span class="text-red-500">*</span>
                        </label>
                        <input type="time" id="heureDebut" name="heureDebut" required
                               value="<c:out value='${heureDebut}'/>"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/30
                                      outline-none transition-all text-sm"/>
                    </div>
                    <div>
                        <label for="heureFin" class="block text-sm font-semibold text-gray-700 mb-2">
                            Heure de fin <span class="text-red-500">*</span>
                        </label>
                        <input type="time" id="heureFin" name="heureFin" required
                               value="<c:out value='${heureFin}'/>"
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
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                        </svg>
                        Ajouter
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>