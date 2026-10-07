<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; }
    </style>
</head>
<body class="bg-white text-gray-900 antialiased">

    <%-- ============ TOP BAR ============ --%>
    <div class="bg-[#00A8E8] text-white text-xs sm:text-sm">
        <div class="max-w-7xl mx-auto px-6 py-2 flex items-center justify-between">
            <div class="flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <span class="hidden sm:inline">Opening Hours: Lun - Ven : 8h00 - 18h00, Dimanche fermé</span>
                <span class="sm:hidden">Lun-Ven : 8h-18h</span>
            </div>
            <div class="flex items-center gap-4">
                <div class="flex items-center gap-1.5">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                    </svg>
                    <span>contact@clinicmanager.ma</span>
                </div>
                <div class="hidden md:flex items-center gap-1.5">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                    </svg>
                    <span>+212 5 22 00 00 00</span>
                </div>
            </div>
        </div>
    </div>

    <%-- ============ HEADER / NAVBAR ============ --%>
    <header class="bg-white shadow-sm sticky top-0 z-30">
        <div class="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/" class="flex items-center gap-2">
                <div class="w-10 h-10 bg-[#00A8E8] rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                    </svg>
                </div>
                <span class="text-2xl font-extrabold text-[#00A8E8] tracking-tight">
                    Clinic<span class="text-gray-900">Manager</span>
                </span>
            </a>

            <nav class="hidden lg:flex items-center gap-8 text-sm font-semibold text-gray-700">
                <a href="#" class="text-[#00A8E8]">Accueil</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">À propos</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">Services</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">Contact</a>
            </nav>

            <a href="${pageContext.request.contextPath}/register"
               class="hidden sm:inline-block bg-[#00A8E8] hover:bg-[#0090c9] text-white font-bold text-sm px-6 py-3 transition-colors">
                Inscription
            </a>
        </div>
    </header>

    <%-- ============ HERO SECTION ============ --%>
    <section class="relative min-h-[calc(100vh-120px)] flex items-center justify-center overflow-hidden">

        <%-- Image de fond médicale --%>
        <div class="absolute inset-0 bg-cover bg-center"
             style="background-image: url('https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?auto=format&fit=crop&w=1600&q=80');">
        </div>

        <%-- Overlay bleu --%>
        <div class="absolute inset-0 bg-gradient-to-r from-[#0a4d68]/95 via-[#0a4d68]/85 to-[#00A8E8]/70"></div>

        <%-- CONTENU --%>
        <div class="relative z-10 w-full max-w-7xl mx-auto px-6 py-16 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">

            <%-- COLONNE GAUCHE — TEXTE --%>
            <div class="text-white">
                <p class="text-sm font-bold tracking-[0.2em] uppercase text-blue-100 mb-4">
                    Bienvenue sur ClinicManager
                </p>
                <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold leading-tight mb-6">
                    Votre Santé,<br>
                    <span class="text-white">Notre Priorité.</span>
                </h1>
                <p class="text-blue-100 text-base sm:text-lg mb-8 max-w-lg">
                    Accédez à votre espace médical sécurisé. Prenez rendez-vous,
                    consultez vos dossiers et gérez votre santé en toute simplicité.
                </p>

                <%-- Mini-stats --%>
                <div class="flex flex-wrap gap-8 pt-6 border-t border-white/20">
                    <div>
                        <div class="text-3xl font-extrabold">3400+</div>
                        <div class="text-xs uppercase tracking-wider text-blue-100">Patients</div>
                    </div>
                    <div>
                        <div class="text-3xl font-extrabold">557</div>
                        <div class="text-xs uppercase tracking-wider text-blue-100">Médecins</div>
                    </div>
                    <div>
                        <div class="text-3xl font-extrabold">4378</div>
                        <div class="text-xs uppercase tracking-wider text-blue-100">RDV / an</div>
                    </div>
                </div>
            </div>

            <%-- COLONNE DROITE — FORMULAIRE --%>
            <div class="w-full max-w-md mx-auto lg:ml-auto">
                <div class="bg-white shadow-2xl p-8 sm:p-10">

                    <div class="mb-8">
                        <h2 class="text-3xl font-extrabold text-gray-900 mb-2">Connexion</h2>
                        <p class="text-gray-500 text-sm">Accédez à votre espace médical.</p>
                    </div>

                    <%-- Messages JSTL --%>
                    <c:if test="${not empty sessionScope.success}">
                        <div class="mb-6 bg-green-50 border-l-4 border-green-500 text-green-700 p-4" role="alert">
                            <p class="text-sm font-medium">
                                <c:out value="${sessionScope.success}"/>
                            </p>
                        </div>
                        <c:remove var="success" scope="session"/>
                    </c:if>

                    <c:if test="${not empty requestScope.error}">
                        <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                            <p class="text-sm font-medium">
                                <c:out value="${requestScope.error}"/>
                            </p>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">

                        <%-- Email --%>
                        <div>
                            <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                                Adresse e-mail
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                                    </svg>
                                </div>
                                <input type="email" id="email" name="email" required
                                       value="<c:out value='${requestScope.email}'/>"
                                       placeholder="votre@email.ma"
                                       class="w-full pl-11 pr-4 py-3 border border-gray-300
                                              focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                              outline-none transition-all text-sm"/>
                            </div>
                        </div>

                        <%-- Mot de passe --%>
                        <div>
                            <div class="flex items-center justify-between mb-2">
                                <label for="motDePasse" class="block text-sm font-semibold text-gray-700">
                                    Mot de passe
                                </label>
                                <a href="#" class="text-xs font-semibold text-[#00A8E8] hover:text-[#0090c9]">
                                    Mot de passe oublié ?
                                </a>
                            </div>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
                                    </svg>
                                </div>
                                <input type="password" id="motDePasse" name="motDePasse" required
                                       placeholder="••••••••"
                                       class="w-full pl-11 pr-12 py-3 border border-gray-300
                                              focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                              outline-none transition-all text-sm"/>
                                <button type="button"
                                        onclick="togglePassword('motDePasse', 'eye-open', 'eye-closed')"
                                        class="absolute inset-y-0 right-0 pr-4 flex items-center text-gray-400 hover:text-[#00A8E8] transition-colors">
                                    <svg id="eye-open" class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                    </svg>
                                    <svg id="eye-closed" class="h-5 w-5 hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"/>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <%-- Bouton bleu --%>
                        <button type="submit"
                                class="w-full bg-[#00A8E8] hover:bg-[#0090c9] text-white font-bold py-3.5 px-6
                                       transition-all shadow-lg shadow-[#00A8E8]/30
                                       focus:ring-4 focus:ring-[#00A8E8]/40 mt-2 uppercase tracking-wider text-sm">
                            Se connecter
                        </button>

                    </form>

                    <%-- Lien inscription --%>
                    <p class="mt-8 text-center text-sm text-gray-600">
                        Pas encore de compte ?
                        <a href="${pageContext.request.contextPath}/register"
                           class="font-bold text-[#FF8800] hover:text-[#e67a00] transition-colors">
                            S'inscrire
                        </a>
                    </p>

                </div>
            </div>
        </div>
    </section>

    <%-- ============ FOOTER ============ --%>
    <footer class="bg-gray-900 text-gray-400 text-xs py-4">
        <div class="max-w-7xl mx-auto px-6 flex flex-col sm:flex-row justify-between items-center gap-2">
            <span>© 2026 ClinicManager. Tous droits réservés.</span>
            <span>Conçu avec ❤️ pour la santé.</span>
        </div>
    </footer>

    <%-- Toggle password --%>
    <script>
        function togglePassword(inputId, eyeOpenId, eyeClosedId) {
            const input = document.getElementById(inputId);
            const eyeOpen = document.getElementById(eyeOpenId);
            const eyeClosed = document.getElementById(eyeClosedId);
            if (input.type === 'password') {
                input.type = 'text';
                eyeOpen.classList.add('hidden');
                eyeClosed.classList.remove('hidden');
            } else {
                input.type = 'password';
                eyeOpen.classList.remove('hidden');
                eyeClosed.classList.add('hidden');
            }
        }
    </script>

</body>
</html>