<?php
                                                $status = $dt_histori['status'];
                                                ?>
                                                <input type="hidden" name="id" value="<?php echo $dt_histori['id_transaksi'];?>">
                                                <?php
                                                if ($status == "menunggu dikonfirm"){
                                                    ?>
                                                    <form action="" method="post">
                                                   <button type="button" name="konfirmasi" class="btn btn-outline-primary">konfirmasi barang</button>
                                                   </form>
                                                    <?php
                                                }elseif ($status == "barang sudah di konfirm"){
                                                    ?>
                                                    <form action="" method="post">
                                                     <button type="button"  name="proses dikemas" class="btn btn-outline-primary">Dikemas</button>
                                                     </form>
                                                    <?php
                                                }elseif ($status == "produk sedang dikemas"){
                                                    ?>
                                                   <form action="" method="post">
                                                   <button type="button" name="dikemas" class="btn btn-outline-primary"> proses Dikemas</button>
                                                   </form>

                                                    <?php
                                                }elseif ($status == "produk sedang dikirim"){
                                                    ?>
                                                    <form action="" method="post">
                                                   <button type="button" name="dikirim"class="btn btn-outline-primary">Dikirim</button> 
                                                   </form>
                                                    
                                                    <?php
                                                }elseif ($status == "produk telah diterima"){
                                                    ?>
                                                    <form action="" method="post">
                                                   <button type="button" name="diterima" class="btn btn-outline-primary">produk diterima</button>  
                                                   </form>
                                                    <?php
                                                }else{
                                                    ?>
                                                    <div class="btn btn-danger" style="pointer-events: none;width:200px;">gagal memproses produk</button>
                                                    <?php
                                                }
                                                ?>