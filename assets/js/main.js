// Mobile menu functionality
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const mobileDropdown = document.getElementById('mobileDropdown');
    
    if (mobileMenuBtn && mobileDropdown) {
        // Toggle mobile dropdown
        mobileMenuBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            mobileDropdown.classList.toggle('active');
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!mobileMenuBtn.contains(e.target) && !mobileDropdown.contains(e.target)) {
                mobileDropdown.classList.remove('active');
            }
        });
        
        // Close dropdown when clicking a link
        const dropdownLinks = mobileDropdown.querySelectorAll('a');
        dropdownLinks.forEach(link => {
            link.addEventListener('click', function() {
                mobileDropdown.classList.remove('active');
            });
        });
        
        // Close dropdown on window resize
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                mobileDropdown.classList.remove('active');
            }
        });
    }
});