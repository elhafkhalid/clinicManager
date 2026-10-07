<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription | ClinicManager</title>
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
                <a href="#" class="hover:text-[#00A8E8] transition-colors">Accueil</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">À propos</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">Services</a>
                <a href="#" class="hover:text-[#00A8E8] transition-colors">Contact</a>
            </nav>

            <a href="${pageContext.request.contextPath}/login"
               class="hidden sm:inline-block bg-[#00A8E8] hover:bg-[#0090c9] text-white font-bold text-sm px-6 py-3 transition-colors">
                Connexion
            </a>
        </div>
    </header>

    <%-- ============ HERO SECTION ============ --%>
    <section class="relative min-h-[calc(100vh-120px)] flex items-center justify-center overflow-hidden">

        <%-- Image de fond --%>
        <div class="absolute inset-0 bg-cover bg-center"
             style="background-image: url('https://images.unsplash.com/photo-1666214280557-f1b5022eb634?auto=format&fit=crop&w=1600&q=80');">
        </div>

        <%-- Overlay bleu --%>
        <div class="absolute inset-0 bg-gradient-to-r from-[#0a4d68]/95 via-[#0a4d68]/85 to-[#00A8E8]/70"></div>

        <%-- CONTENU --%>
        <div class="relative z-10 w-full max-w-7xl mx-auto px-6 py-16 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">

            <%-- COLONNE GAUCHE — TEXTE --%>
            <div class="text-white">
                <p class="text-sm font-bold tracking-[0.2em] uppercase text-blue-100 mb-4">
                    Rejoignez ClinicManager
                </p>
                <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold leading-tight mb-6">
                    Créez votre<br>
                    <span class="text-white">Espace Santé.</span>
                </h1>
                <p class="text-blue-100 text-base sm:text-lg mb-8 max-w-lg">
                    Inscrivez-vous en quelques secondes et profitez de tous nos services :
                    prise de rendez-vous en ligne, suivi médical et accès sécurisé à vos dossiers.
                </p>

                <%-- Avantages --%>
                <ul class="space-y-3 pt-6 border-t border-white/20">
                    <li class="flex items-center gap-3">
                        <div class="w-8 h-8 rounded-full bg-white/20 flex items-center justify-center flex-shrink-0">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="3" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                            </svg>
                        </div>
                        <span class="text-blue-50">Prise de RDV en ligne 24h/24</span>
                    </li>
                    <li class="flex items-center gap-3">
                        <div class="w-8 h-8 rounded-full bg-white/20 flex items-center justify-center flex-shrink-0">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="3" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                            </svg>
                        </div>
                        <span class="text-blue-50">Dossier médical numérique sécurisé</span>
                    </li>
                    <li class="flex items-center gap-3">
                        <div class="w-8 h-8 rounded-full bg-white/20 flex items-center justify-center flex-shrink-0">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="3" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                            </svg>
                        </div>
                        <span class="text-blue-50">Notifications de rappel automatiques</span>
                    </li>
                </ul>
            </div>

            <%-- COLONNE DROITE — FORMULAIRE --%>
            <div class="w-full max-w-md mx-auto lg:ml-auto">
                <div class="bg-white shadow-2xl p-8 sm:p-10">

                    <div class="mb-8">
                        <h2 class="text-3xl font-extrabold text-gray-900 mb-2">Inscription</h2>
                        <p class="text-gray-500 text-sm">Créez votre compte patient en quelques secondes.</p>
                    </div>

                    <%-- Messages JSTL --%>
                    <c:if test="${not empty requestScope.error}">
                        <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                            <p class="text-sm font-medium">
                                <c:out value="${requestScope.error}"/>
                            </p>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-4">

                        <%-- Nom --%>
                        <div>
                            <label for="nom" class="block text-sm font-semibold text-gray-700 mb-2">
                                Nom complet
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                    </svg>
                                </div>
                                <input type="text" id="nom" name="nom" required
                                       value="<c:out value='${requestScope.nom}'/>"
                                       placeholder="Jean Dupont"
                                       class="w-full pl-11 pr-4 py-3 border border-gray-300
                                              focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                              outline-none transition-all text-sm"/>
                            </div>
                        </div>

                        <%-- CIN --%>
                        <div>
                            <label for="cin" class="block text-sm font-semibold text-gray-700 mb-2">
                                CIN (Carte d'identité nationale)
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M10 6H5a2 2 0 00-2 2v10a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 012-2h2a2 2 0 012 2v1m-4 0h4"/>
                                    </svg>
                                </div>
                                <input type="text" id="cin" name="cin" required
                                       value="<c:out value='${requestScope.cin}'/>"
                                       placeholder="AB123456"
                                       class="w-full pl-11 pr-4 py-3 border border-gray-300
                                              focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                              outline-none transition-all text-sm"/>
                            </div>
                        </div>

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
                            <label for="motDePasse" class="block text-sm font-semibold text-gray-700 mb-2">
                                Mot de passe <span class="text-gray-400 font-normal">(min. 6 caractères)</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
                                    </svg>
                                </div>
                                <input type="password" id="motDePasse" name="motDePasse" required minlength="6"
                                       oninput="checkStrength(this.value)"
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

                            <%-- Barre de force --%>
                            <div class="mt-2 h-1.5 w-full bg-gray-200 rounded-full overflow-hidden">
                                <div id="strengthBar" class="h-full w-0 transition-all duration-300"></div>
                            </div>
                            <p id="strengthText" class="text-xs text-gray-400 mt-1">Force du mot de passe</p>
                        </div>

                        <%-- CGU --%>
                        <div class="flex items-start gap-2 pt-1">
                            <input type="checkbox" id="cgu" required
                                   class="mt-1 w-4 h-4 text-[#00A8E8] border-gray-300 rounded
                                          focus:ring-[#00A8E8]">
                            <label for="cgu" class="text-xs text-gray-600">
                                J'accepte les
                                <a href="#" class="text-[#00A8E8] font-semibold hover:underline">conditions générales</a>
                                et la
                                <a href="#" class="text-[#00A8E8] font-semibold hover:underline">politique de confidentialité</a>.
                            </label>
                        </div>

                        <%-- Bouton orange --%>
                        <button type="submit"
                                class="w-full bg-[#FF8800] hover:bg-[#e67a00] text-white font-bold py-3.5 px-6
                                       transition-all shadow-lg shadow-[#FF8800]/30
                                       focus:ring-4 focus:ring-[#FF8800]/40 mt-2 uppercase tracking-wider text-sm">
                            Créer mon compte
                        </button>

                    </form>

                    <%-- Lien connexion --%>
                    <p class="mt-6 text-center text-sm text-gray-600">
                        Déjà un compte ?
                        <a href="${pageContext.request.contextPath}/login"
                           class="font-bold text-[#00A8E8] hover:text-[#0090c9] transition-colors">
                            Se connecter
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

    <%-- JS : toggle password + force meter --%>
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

        function checkStrength(password) {
            const bar = document.getElementById('strengthBar');
            const text = document.getElementById('strengthText');
            let score = 0;
            if (password.length >= 6) score++;
            if (password.length >= 10) score++;
            if (/[A-Z]/.test(password)) score++;
            if (/[0-9]/.test(password)) score++;
            if (/[^A-Za-z0-9]/.test(password)) score++;

            bar.className = 'h-full transition-all duration-300';

            if (password.length === 0) {
                bar.style.width = '0%';
                text.textContent = 'Force du mot de passe';
                text.className = 'text-xs text-gray-400 mt-1';
            } else if (score <= 1) {
                bar.style.width = '25%';
                bar.classList.add('bg-red-500');
                text.textContent = 'Faible';
                text.className = 'text-xs text-red-500 mt-1';
            } else if (score === 2) {
                bar.style.width = '50%';
                bar.classList.add('bg-orange-500');
                text.textContent = 'Moyen';
                text.className = 'text-xs text-orange-500 mt-1';
            } else if (score === 3) {
                bar.style.width = '75%';
                bar.classList.add('bg-yellow-500');
                text.textContent = 'Bon';
                text.className = 'text-xs text-yellow-600 mt-1';
            } else {
                bar.style.width = '100%';
                bar.classList.add('bg-green-500');
                text.textContent = 'Fort';
                text.className = 'text-xs text-green-600 mt-1';
            }
        }
    </script>

</body>
</html>