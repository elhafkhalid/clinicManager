<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <c:choose>
        <c:when test="${not empty doctor and not empty doctor.id}">
            <title>Modifier médecin | ClinicManager</title>
        </c:when>
        <c:otherwise>
            <title>Nouveau médecin | ClinicManager</title>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- Mode : Update si doctor a un id --%>
        <c:set var="isEdit" value="${not empty doctor and not empty doctor.id}"/>

        <%-- BREADCRUMB --%>
        <nav class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <a href="${pageContext.request.contextPath}/admin/doctors"
               class="hover:text-[#00A8E8] transition-colors">
                Médecins

            </a>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
            </svg>
            <span class="text-gray-800 font-semibold">
                <c:choose>
                    <c:when test="${isEdit}">Modifier</c:when>
                    <c:otherwise>Nouveau</c:otherwise>
                </c:choose>
            </span>
        </nav>

        <%-- TOPBAR --%>
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">
                <c:choose>
                    <c:when test="${isEdit}">Modifier le médecin</c:when>
                    <c:otherwise>Nouveau médecin</c:otherwise>
                </c:choose>
            </h1>
            <p class="text-gray-500 text-sm mt-1">
                <c:choose>
                    <c:when test="${isEdit}">Modifiez les informations du médecin.</c:when>
                    <c:otherwise>Créez un nouveau médecin pour la clinique.</c:otherwise>
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
        <div class="bg-white shadow-md max-w-3xl">

            <c:set var="formAction" value="${isEdit ? 'edit' : 'new'}"/>

            <form action="${pageContext.request.contextPath}/admin/doctors/${formAction}"
                  method="POST"

                  class="p-8 space-y-6">

                <%-- Champ caché id --%>
                <c:if test="${isEdit}">
                    <input type="hidden" name="id" value="${doctor.id}"/>
                </c:if>

                <%-- Nom + Titre (2 colonnes) --%>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <%-- Nom --%>
                    <div>
                        <label for="nom" class="block text-sm font-semibold text-gray-700 mb-2">
                            Nom complet <span class="text-red-500">*</span>
                        </label>
                        <input type="text" id="nom" name="nom" required maxlength="100"
                               value="<c:out value='${doctor.nom}'/>"
                               placeholder="Ex : Sarah Martin"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                    </div>

                    <%-- Titre --%>
                    <div>
                        <label for="titre" class="block text-sm font-semibold text-gray-700 mb-2">
                            Titre <span class="text-red-500">*</span>
                        </label>
                        <input type="text" id="titre" name="titre" required maxlength="50"
                               value="<c:out value='${doctor.titre}'/>"
                               placeholder="Ex : Dr, Pr, Interne"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                    </div>
                </div>

                <%-- Email + Matricule (2 colonnes) --%>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <%-- Email --%>
                    <div>
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                            Email <span class="text-red-500">*</span>
                        </label>
                        <input type="email" id="email" name="email" required maxlength="150"
                               value="<c:out value='${doctor.email}'/>"
                               placeholder="s.martin@clinic.ma"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                    </div>

                    <%-- Matricule --%>
                    <div>
                        <label for="matricule" class="block text-sm font-semibold text-gray-700 mb-2">
                            Matricule <span class="text-red-500">*</span>
                        </label>
                        <input type="text" id="matricule" name="matricule" required maxlength="50"
                               value="<c:out value='${doctor.matricule}'/>"
                               placeholder="Ex : MED-2024-001"
                               class="w-full px-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm font-mono"/>
                    </div>
                </div>

                <%-- Mot de passe --%>
                <div>
                    <label for="motDePasse" class="block text-sm font-semibold text-gray-700 mb-2">
                        Mot de passe
                        <c:choose>
                            <c:when test="${isEdit}">
                                <span class="text-gray-400 font-normal">(laisser vide pour garder l'ancien)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-red-500">*</span>
                                <span class="text-gray-400 font-normal">(min. 6 caractères)</span>
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <div class="relative">
                        <input type="password" id="motDePasse" name="motDePasse"
                               minlength="6"
                               <c:if test="${not isEdit}">required</c:if>
                               placeholder="••••••••"
                               class="w-full px-4 py-3 pr-12 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                        <button type="button"
                                onclick="togglePassword()"
                                class="absolute inset-y-0 right-0 pr-4 flex items-center text-gray-400 hover:text-[#00A8E8] transition-colors">
                            <svg id="eye" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <%-- Spécialité --%>
                <div>
                    <label for="specialtyId" class="block text-sm font-semibold text-gray-700 mb-2">
                        Spécialité <span class="text-red-500">*</span>
                    </label>
                    <select id="specialtyId" name="specialtyId" required
                            class="w-full px-4 py-3 border border-gray-300
                                   focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                   outline-none transition-all text-sm bg-white cursor-pointer">
                        <option value="">-- Sélectionner une spécialité --</option>
                        <c:forEach items="${specialties}" var="spec">
                            <option value="${spec.id}"
                                    ${not empty doctor and not empty doctor.specialty
                                      and doctor.specialty.id == spec.id ? 'selected' : ''}>
                                <c:out value="${spec.name}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <%-- BOUTONS --%>
                <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
                    <a href="${pageContext.request.contextPath}/admin/doctors"
                       class="px-6 py-3 text-sm font-bold text-gray-600
                              hover:bg-gray-100 transition-colors uppercase tracking-wider">
                        Annuler
                    </a>
                    <button type="submit"
                            class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                                   text-white font-bold px-6 py-3 transition-colors
                                   text-sm uppercase tracking-wider shadow-lg shadow-[#00A8E8]/30">
                        <c:choose>
                            <c:when test="${isEdit}">Modifier</c:when>
                            <c:otherwise>Enregistrer</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </main>

    <script>
        function togglePassword() {
            const input = document.getElementById('motDePasse');
            input.type = input.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>
</html>