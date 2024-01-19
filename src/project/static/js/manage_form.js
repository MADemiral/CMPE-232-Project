document.addEventListener('DOMContentLoaded', function () {
    const actionSelect = document.getElementById('action');
    const form = document.querySelector('form');

    actionSelect.addEventListener('change', function () {
       
        const existingFields = form.querySelectorAll('.dynamic-field');
        existingFields.forEach(field => field.remove());

        
        const selectedAction = actionSelect.value;

        if (selectedAction === 'insert' || selectedAction === 'update') {
            
            addInputField('v_ssn', 'Visitor SSN',9,9);
            addInputField('v_name', 'Visitor Name',1,50);
            addInputField('v_surname', 'Visitor Surname',1,50);
            addInputField('v_phone_no', 'Visitor Phone Number',12,12);
            addInputField('v_zip', 'Visitor Zip',5,5);
            addInputField('v_city', 'Visitor City',1,25);

        } else if (selectedAction === 'delete') {
            
            addInputField('v_ssn', 'Visitor SSN',9,9);
        }
    });

    function addInputField(name, label, minlength, maxlength,telno) {
        if(telno){
            
        }
        const inputField = document.createElement('div');
        inputField.className = 'form-group dynamic-field';
        inputField.innerHTML = `
            <label for="${name}">${label}</label>
            <input type="text" id="${name}" name="${name}" minlength="${minlength}" maxlength="${maxlength}" required>
        `;
        form.insertBefore(inputField, form.lastElementChild);
    }
});

function showAlert(message) {
    alert(message);
}