{include $theme['head']}  

{include $theme['navbar']}  

{include $theme['staf-sidebar']} 

  

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    {include $theme['breadcrump']} 

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">

     		
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="card">
							
							<div class="card-body">
								<h4 class="header-title">Customer Present</h4>
								<br>
								<!-- card tools -->
								<div class="card-tools" style="display: none">
								  <button type="button" class="btn btn-primary btn-sm" data-toggle="tooltip" onClick="clearform();$('#frmADD').modal('show');">
									<i class="fas fa-plus"></i> Tambah
								  </button>
								</div>
								<div class="table-responsive mt-3">
									<table id="datatable" class="table table-bordered table-striped">
										<thead>
											<tr>
                                                <th>Minat Present</th>
												<th>Tanggal Present</th>
                                                <th>Account</th>
												<th>Present hadir</th>
                                                <th>Handle Present</th>
												<th>Alasan no present</th>
                                                <th>Order</th>
                                                <th>Alasan no Order</th>
                                                <th>Source</th>
                                                <th>type</th>
                                                <th>Action</th>
											</tr>
										</thead>
										<tbody id="ListTrade">
										{if count($cust['data']) > 0}										
										{foreach from=$cust['data'] item=p key="key"}
										<tr id="tr{$p['id']}">
                                            <td>{$p['date_present']}</td>
											<td><span style="display: none;">{$p['tanggal_present']}</span>
												<input type="date" class="date-input" id="date-input" name="date-input" value="{$p["tanggal_present"]}" onChange="ganti_tanggal_present(this.value, {$p['id']})" />
											</td>
                                            <td><span style="display: none;">{$p['name']}</span>
                                                {if isset($p['account_id'])}{$p['account_id']} <a href="javascript:void(0)" onClick="copyTextToClipboard('{$p['account_id']}')">Copy</a><br/>{/if}
                                                {$p['name']} <br/> <a href="https://n.gass.co.id/cust/{$p['id']}" target="_blank">{$p['phone']}</a></td>
									  	    <td>
                                                <div class="form-check" onClick="ganti_present({$p['id']})">
                                                      <input class="form-check-minat{$p['id']}" type="checkbox" value="" id="minat{$p['id']}" {if $p['present_hadir']==1}checked{/if} >
                                                      <label class="form-check-minat{$p['id']}" for="minat{$p['id']}">
                                                        Present hadir
                                                      </label>  
                                                    </div>
                                            </td> 
                                            <td><span style="display: none;">{$p['handle_present']}</span>
                                                  <select class="form-control" onChange="ganti_handle_present(this, {$p['id']})" id="">
                                                    <option value="" {if $p['handle_present'] ==''}selected{/if}></option>
													<option value="Grand" {if $p['handle_present'] =='Grand'}selected{/if}>Grand</option>
													<option value="Wahyu" {if $p['handle_present'] =='Wahyu'}selected{/if}>Wahyu</option>
                                                  </select>
                                             </td>
										  	  <td><span style="display: none;">{$p['alasan_no_present']}</span>
                                                  <select class="form-control" onChange="ganti_alasan(this, {$p['id']})" id="">
                                                    <option value="" {if $p['alasan_no_present'] ==''}selected{/if}></option>
													<option value="Presentor tidak hadir" {if $p['alasan_no_present'] =='Presentor tidak hadir'}selected{/if}>Presentor tidak hadir</option>
													<option value="Peserta tidak hadir" {if $p['alasan_no_present'] =='Peserta tidak hadir'}selected{/if}>Peserta tidak hadir</option>
                                                    <option value="Butuh Jasa Iklan" {if $p['alasan_no_present'] =='Butuh Jasa Iklan'}selected{/if}>Butuh Jasa Iklan</option>
                                                    <option value="Belum Butuh" {if $p['alasan_no_present'] =='Belum Butuh'}selected{/if}>Belum Butuh</option>
                                                    <option value="Langsung Mau Order" {if $p['alasan_no_present'] =='Langsung Mau Order'}selected{/if}>Langsung Mau Order</option>
                                                  </select>
                                             </td>
                                              <td><span style="display: none;">{$p['status_order']}</span>
                                                <select class="form-control" onChange="ganti_order(this, {$p['id']})" id="">
                                                    <option value="" {if $p['status_order'] ==''}selected{/if}>Belum Order</option>
                                                    <option value="Order" {if $p['status_order'] =='Order'}selected{/if}>Order</option>
                                                    <option value="Tidak" {if $p['status_order'] =='Tidak'}selected{/if}>Tidak</option>
                                                    <option value="Menolak" {if $p['status_order'] =='Menolak'}selected{/if}>Menolak</option>
                                                    <option value="Pending" {if $p['status_order'] =='Pending'}selected{/if}>Pending</option>
                                                </select>
                                            </td>
                                            <td><span style="display: none;">{$p['alasan_no_order']}</span>
                                                  <select class="form-control" onChange="ganti_alasan_order(this, {$p['id']})" id="">
                                                    <option value="" {if $p['alasan_no_order'] ==''}selected{/if}></option>
                                                    <option value="Butuh Jasa Iklan" {if $p['alasan_no_order'] =='Butuh Jasa Iklan'}selected{/if}>Butuh Jasa Iklan</option>
                                                    <option value="Belum Butuh" {if $p['alasan_no_order'] =='Belum Butuh'}selected{/if}>Belum Butuh</option>
                                                    <option value="Langsung Mau Order" {if $p['alasan_no_order'] =='Langsung Mau Order'}selected{/if}>Langsung Mau Order</option>
                                                  </select>
                                             </td>
                                            <td><span style="display: none;">{$p['source']}</span>
                                                  <select class="form-control" onChange="ganti_source(this, {$p['id']})" id="">
                                                    <option value="" {if $p['source'] ==''}selected{/if}></option>
                                                    <option value="Google" {if $p['source'] =='Google'}selected{/if}>Google</option>
                                                    <option value="Facebook" {if $p['source'] =='Facebook'}selected{/if}>Facebook</option>
                                                    <option value="Tiktok" {if $p['source'] =='Tiktok'}selected{/if}>Tiktok</option>
                                                    <option value="Instagram" {if $p['source'] =='Instagram'}selected{/if}>Instagram</option>
                                                    <option value="Teman" {if $p['source'] =='Teman'}selected{/if}>Teman</option>
                                                  </select>
                                             </td>
                                            <td><span style="display: none;">{$p['type_customer']}</span>
                                                  <select class="form-control" onChange="ganti_type(this, {$p['id']})" id="">
                                                    <option value="" {if $p['type_customer'] ==''}selected{/if}></option>
                                                    <option value="personal" {if $p['type_customer'] =='personal'}selected{/if}>personal</option>
                                                    <option value="agency" {if $p['type_customer'] =='agency'}selected{/if}>agency</option>
                                                    <option value="corporate" {if $p['type_customer'] =='corporate'}selected{/if}>corporate</option>
                                                    <option value="comunity" {if $p['type_customer'] =='comunity'}selected{/if}>comunity</option>
                                                  </select>
                                             </td>
                                             <td>
                                                 <button class="btn btn-success" type="button" onClick="hide_present('{$p['id']}')">Done</button>	
                                                 <button class="btn btn-info" type="button" onClick="view_log('{$p['id']}')">Activity</button>	
                                             </td>
											  <textarea id="json{$p['id']}" style="display:none">{$p|@json_encode}</textarea>
										</tr>
										{/foreach} 
										{/if}
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<div class="modal fade" id="frmADD">
  <div class="modal-dialog">
	<div class="modal-content">

	  <!-- Modal Header -->
	  <div class="modal-header">
		<h4 class="modal-title">Tambah</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  </div>
	  <!-- Modal body -->
	  <div class="modal-body">
		<div class="row">  
			<div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Name</label>
					<input class="form-control" type="text" placeholder="Enter Name" name="name" id="name">
				<span class="material-input"></span></div>
			</div> 
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Phone</label>
					<input class="form-control" type="tel" placeholder="Enter phone" name="phone" id="phone">
				<span class="material-input"></span></div>
			</div>
            <div class="col-md-12">
				<div class="form-group label-floating is-empty">
					<label class="control-label">Email</label>
					<input class="form-control" type="email" placeholder="Enter email" name="email" id="email">
				<span class="material-input"></span></div>
			</div>
		</div>
	  </div>

	  <!-- Modal footer -->
	  <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		<button class="btn btn-primary" onclick="simpan()">Simpan</button>
	  </div>

	</div>
  </div>
</div>

{include $theme['footer']}  
{literal}
<script>
  $(function () {

  })
  $( document ).ready(function() {
		
	});
  function clearform(){
      $("#code").val('');
  }

  function view_log(id){
      $("#activity").html('');
      $.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'view_log', 'id' : id},
		dataType: "json",
		success: function(e) { 		
			if( e.code == 1){
				$.each(e.data, function(key, val) {             
                    $("#activity").append('<div class="mb-1"><span>['+val.waktu+'] <br> <i>'+val.keterangan+'</i></span></div>');  
                }); 	
                $("#nav-toggle-button").ControlSidebar('toggle');
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
    
  function hide_present(id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'hide_present', 'id' : id},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
                $('#tr'+id).remove();
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
    
  function ganti_present(id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_present', 'id' : id},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
                //$('#tr'+id).remove();
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }

  function ganti_handle_present(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_handle_present', 'id' : id, present: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
    
  function ganti_alasan(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_alasan', 'id' : id, alasan: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
    
 function ganti_order(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_order', 'id' : id, order: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }

  function ganti_alasan_order(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_alasan_order', 'id' : id, alasan: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
    
function ganti_source(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_source', 'id' : id, source: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
  function ganti_type(tg, id){
    waitingDialog.show('Loading..');
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: {act:'ganti_type', 'id' : id, type: $(tg).val()},
		dataType: "json",
		success: function(e) { 	
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			if( e.code == 1){
				openmsg(e.msg, "success");						
			}else{
				openmsg(e.msg, 'error');
			}
		},error: function() {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);	
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');				
		}
	})
  }
  function simpan(){
	$("#frmAddINOUT").modal('hide');
	waitingDialog.show('Loading..');
	var dt = {act:'add', code: $("#code").val()};
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: dt,
		dataType: "json",
		success: function(e) {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);			
			if(e.code==1){
				openmsg(e.msg, 'success');
				setTimeout(function () {
				  window.location.href = window.document.URL;
				}, 2000);
			}else{
				openmsg(e.msg, 'error');
				$("#frmAddINOUT").modal('show');
			}						
		},error: function() {
			$("#frmAddINOUT").modal('show');
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);
		}
	});
}
    
function openmsg(msg, tipe){
	const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 2500
    });
	Toast.fire({
        icon: tipe,
        title: msg
      })
}
function copyTextToClipboard(text) {
  navigator.clipboard.writeText(text).then(function() {
      openmsg('Text copied to clipboard', 'success');
  }).catch(function(error) {
      openmsg('Error copying text: '+error, 'error');
  });
}
var dtIntegration = function() {
	$.extend(true, $.fn.dataTable.defaults, {
		"sDom": "<'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>",
		"sPaginationType": "bootstrap",
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sSearch": "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>",
			"sInfo": "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>",
			"oPaginate": {
				"sPrevious": "",
				"sNext": ""
			}
		}
	});
	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper form-inline",
		"sFilterInput": "form-control",
		"sLengthSelect": "form-control"
	});
};
  $(function () {
    $('#datatable').DataTable({
      "responsive": true,
      "autoWidth": false,
        "order": [[0, "desc" ]]
    });
  });




function ganti_tanggal_present(selectedDate, id) {
    // Format the date if needed (it's already YYYY-MM-DD)
    const formattedDate = selectedDate; 

	waitingDialog.show('Loading..');
	var dt = {act:'ganti_tanggal_present', date: selectedDate, id: id};
	$.ajax({
		type: "POST",
		url: '{/literal}{$app->fullpath}{literal}',
		data: dt,
		dataType: "json",
		success: function(e) {
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);			
			if(e.code==1){
				openmsg(e.msg, 'success');
				setTimeout(function () {
				  window.location.href = window.document.URL;
				}, 2000);
			}else{
				openmsg(e.msg, 'error');
			}						
		},error: function() {
			openmsg('Gagal menghubungkan ke server, coba ulangi lagi!', 'error');
			setTimeout(function(){
				waitingDialog.hide();
			}, 1000);
		}
	});
}



</script>
{/literal}