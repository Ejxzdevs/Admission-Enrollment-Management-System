<style>
    .navBarContainer{
        height: 100%;
        display: flex;
        flex-direction: row;
    }

    .SearchBarContainer {
        width: 70%;
        padding-left: 1rem;
        display: flex;
        align-items: center;
    

    }

    .SearchBarContainer form{
        border: solid 2px #3C6E8B;
        height: 2rem;
        border-radius: 5px;
        width: 350px;
        background-color: #fff;
        display: flex;
        flex: row;
        align-items: center;
        padding: 0 10px;
        gap: 4px;
    }

    .SearchBarContainer form input {
        width: 100%;
        outline: none;
        padding-left: 3px;
        border: none;
    }
    .subcontainer{
        width: 30%;
        display: flex;
        flex-direction: row;
        justify-content: end;
        align-items: center;
        gap: 25px;
        padding-right: 10px;
    }
    .subcontainer i {
        font-size: 20px;
        color: white;
    }

    .subcontainer p{
        color: white;
        text-transform: capitalize;
        font-family:Arial, Helvetica, sans-serif

    }

    .authContainer{
        height: 100%;
        width: 30%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 10px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div class="navBarContainer" >
    <div class="SearchBarContainer" >
        <form action="">
            <i class="bi bi-search"></i>
            <input type="text" placeholder="Search Words..." >

        </form>
    </div>
    <div class="subcontainer" >
        <i class="bi bi-bell"></i>
        <i class="bi bi-envelope"></i>
        <div class="authContainer">
            <i class="bi bi-person-circle"></i>
            <p>admin</p>
        </div>
    </div>
</div>