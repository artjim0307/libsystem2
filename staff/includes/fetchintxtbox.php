<?php
include ('includes/conn.php');


if(isset($_POST['search_post_btn']))
{
        $id = $_post['id'];

        $query = "SELECT * from bookinformation where id= '$id'";
        $query_run = mysqli_query($connection,$query);

        if($query_run)
        {

                while($row = mysqli_fetch_array($query_run)>0)
                {
                    ?>
                    <tr>
                        <th class="msg"> Enter ISBN</th>
                        <td><input type="hidden" class="textbox" name="isbn" id="isbn" value="<?php echo $row ['isbn']?>"> </td>
                        </tr>
                        <tr>
                        <th class="msg"> Enter ISBN</th>
                        <td><input type="hidden" class="textbox" name="isbn" id="isbn" value="<?php echo $row ['isbn']?>"> </td>
                        </tr>
                        <tr>
                        <th class="msg"> Enter ISBN</th>
                        <td><input type="hidden" class="textbox" name="isbn" id="isbn" value="<?php echo $row ['isbn']?>"> </td>
                        </tr>
                        <tr>
                        <th class="msg"> Enter ISBN</th>
                        <td><input type="hidden" class="textbox" name="isbn" id="isbn" value="<?php echo $row ['isbn']?>"> </td>
                        </tr>
                        <tr>
                        <th class="msg"> Enter ISBN</th>
                        <td><input type="hidden" class="textbox" name="isbn" id="isbn" value="<?php echo $row ['isbn']?>"> </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="submit" class="btn" name="search" id="search" value="add data"></td>
                        </tr>
                <?php
                }
        }               
        else{

            echo" data not found";
        }
}

?>